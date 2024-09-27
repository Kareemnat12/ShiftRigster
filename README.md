# SLSR (Shift Left Shift Right) Verilog Module

This repository contains a Verilog module `slsr` (Shift Left Shift Right) that implements an 8-bit shift register with left and right shift capabilities.

## Module Description

The `slsr` module is a versatile 8-bit shift register that can perform the following operations:

- Shift left: Shifts in a new bit from the right (LSB)
- Shift right: Shifts in a new bit from the left (MSB)
- Reset: Clears the register to all zeros

### Inputs

- `sl`: Shift left control signal
- `sr`: Shift right control signal
- `reset`: Asynchronous reset signal
- `clk`: Clock signal
- `din`: Data input for shifting

### Output

- `Q`: 8-bit output representing the current state of the shift register

## Functionality

1. On the positive edge of the clock or reset signal:
   - If `reset` is high, the register is cleared to all zeros.
   - If `sl` is high and `sr` is low, a left shift is performed, with `din` entering at the MSB.
   - If `sr` is high and `sl` is low, a right shift is performed, with `din` entering at the LSB.

2. The current state of the register is continuously output to `Q`.

## Usage

To use this module in your Verilog project:

1. Include the `slsr.v` file in your project directory.
2. Instantiate the module in your top-level design or testbench:

```verilog
slsr my_shift_register (
    .sl(sl_signal),
    .sr(sr_signal),
    .reset(reset_signal),
    .clk(clock_signal),
    .din(data_in),
    .Q(shift_register_out)
);
```

## Testing

To verify the functionality of this module, create a testbench that:

1. Applies various combinations of `sl` and `sr`
2. Feeds different `din` values
3. Toggles the `reset` signal
4. Monitors the `Q` output to ensure correct shifting behavior

