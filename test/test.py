# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: MIT

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_project(dut):
  dut._log.info("Start")
  
  # Our example module doesn't use clock and reset, but we show how to use them here anyway.
  clock = Clock(dut.clk, 10, units="us")
  cocotb.start_soon(clock.start())

  # Reset
  dut._log.info("Reset")
  dut.ena.value = 1
  dut.ui_in.value = 0
  dut.uio_in.value = 0
  dut.rst_n.value = 0
  await ClockCycles(dut.clk, 1)
  dut.rst_n.value = 1

  # Set the input values, wait one clock cycle, and check the output
  # Because it's an amd gate the outputs should all be zero

  fail_count = 0
  dut._log.info("Test And _0")
  for h_mask in [4>>x for x in range(4)]:
      dut.ui_in.value = (h_mask<<4)|0xF
      for i in range((2**6)-1):
          dut.uio_in.value = (0<<6)|i
          await ClockCycles(dut.clk, 1)
          fail_count += dut.uo_out.value & 0x0F
      if h_mask > 0:
          dut.uio_in.value = (3<<6)| ((2**6)-1)
          await ClockCycles(dut.clk, 1)
          fail_count += (dut.uo_out.value & 0x1F) - 0x1F

  dut._log.info(f'fail_count={fail_count}')
  assert fail_count == 0

  fail_count = 0
  dut._log.info("Test And _1 _2 plus Invh")
  for h_mask in [4,2,1]:
      dut.ui_in.value = (h_mask<<4)|0xF

      dut.uio_in.value = ((3)<<6)| ((2**6)-1)
      await ClockCycles(dut.clk, 1)
      fail_count += (dut.uo_out.value & 0x1F) - 0x1F

      dut.uio_in.value = ((3)<<6)| (((2**6)-2))
      await ClockCycles(dut.clk, 1)
      fail_count += (dut.uo_out.value & 0x1F) - 0x0

      dut.uio_in.value = ((1)<<6)| (((2**6)-2))
      await ClockCycles(dut.clk, 1)
      fail_count += (dut.uo_out.value & 0x1F) - 0x0F

      dut.uio_in.value = ((1)<<6)| (((2**6)-1))
      await ClockCycles(dut.clk, 1)
      fail_count += (dut.uo_out.value & 0x1F) - 0x10

  dut._log.info(f'fail_count={fail_count}')
  assert fail_count == 0

