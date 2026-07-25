# FSM-Based Vending Machine using Verilog HDL

A Finite State Machine (FSM) based vending machine implemented in Verilog HDL using the Mealy Machine model. The design accepts ₹5 and ₹10 coins, dispenses a product priced at ₹15, returns change when required, and supports transaction cancellation.

---

## Features

- Mealy FSM implementation
- Supports ₹5 and ₹10 coin denominations
- Product price fixed at ₹15
- Automatic product dispensing
- ₹5 change return for overpayment
- Transaction cancellation with refund
- Verified using Verilog testbench and simulation waveforms

---

## FSM Description

### States

| State | Description |
|--------|-------------|
| S0 | ₹0 inserted |
| S1 | ₹5 inserted |
| S2 | ₹10 inserted |

---

## Inputs

| Signal | Description |
|---------|-------------|
| clk | Clock |
| rst | Reset |
| in | Coin Input |

### Coin Encoding

| Input | Meaning |
|-------|---------|
| 00 | No Coin / Cancel |
| 01 | ₹5 Coin |
| 10 | ₹10 Coin |

---

## Outputs

| Signal | Description |
|---------|-------------|
| out | Product Dispense |
| change | Returned Change |

---

## Test Cases

| Coins Inserted | Dispense | Change |
|---------------|----------|--------|
| ₹5 → ₹10 | Yes | ₹0 |
| ₹10 → ₹5 | Yes | ₹0 |
| ₹10 → ₹10 | Yes | ₹5 |
| ₹5 → Cancel | No | ₹5 |
| ₹10 → Cancel | No | ₹10 |

---

## Simulation

Simulation was performed using Verilog HDL on EDA Playground. Functional verification was carried out through waveform analysis.

---

## Tools Used

- Verilog HDL
- EDA Playground
- EPWave

---

## Author

Khushi Shah
