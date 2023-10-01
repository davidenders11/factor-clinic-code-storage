# Register Setup

- 31 64-bit registers, `[x0 ... x30]` (`[w0 ... w30]`) are the lower 32 bits of each of these registers
  - ARM defines what each of these should be used for (see pg. 105 of Blue Fox)
- Program counter `PC` holds the address of the current instruction
  - Cannot be accessed directly
- `SP` stack pointer can also not be accessed directly, only with loading, adding, aligning
  - Should always be quadword aligned
- `XZR` the zero register always has the zero value
- `LR` (`X30`) the link register is for storing return addresses when a function is invoked
- `X29` the frame pointer is often used to explicitly keep track of stack frames

# Assembly Code Generally

- Mnemonics, registers, integer values, etc. are all just more readable forms of machine code (opcodes)
