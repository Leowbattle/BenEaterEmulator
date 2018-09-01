module ben_eater;

import std.stdio;

class BenEaterEmulator {
	public this(ubyte[16] program) {
		memory[]= program;
	}

	public void run() {
		while (true) {
			ubyte instruction = memory[pc++];
			ubyte opcode = instruction >> 4;
			ubyte argument = instruction & 0x0f;

			switch (opcode) with (Opcodes) {
				case LDA:
					regA = memory[argument];
					break;
				case ADD:
					ubyte temp = regA;
					regA += memory[argument];
					if (regA < temp) carryFlag = true;
					break;
				case SUB:
					ubyte temp = regA;
					regA -= memory[argument];
					if (regA > temp) carryFlag = true;
					break;
				case STA:
					memory[argument] = regA;
					break;
				case OUT:
					writeln(regA);
					break;
				case JMP:
					pc = argument;
					break;
				case LDI:
					regA = argument;
					break;
				case JC:
					if (carryFlag) pc = argument;
					break;
				case NOP:
					break;
				case HLT:
					writeln("Done");
					return;
				default:
					writefln("Invalid.\nOpcode: %08b\nArgument: %08b", opcode, argument);
					break;
			}
			//writefln("%08b", instruction);
		}
	}

	private ubyte[16] memory; // Both the program and the variables it uses
	private ubyte pc = 0; // Program counter
	private ubyte regA; // Register A
	private ubyte regB; // Register B
	private bool carryFlag; // When there was an overflow or underflow in the last operation

	enum Opcodes {
		LDA = 0b0001,
		ADD = 0b0010,
		SUB = 0b0011,
		STA = 0b0100,
		OUT = 0b0101,
		JMP = 0b0110,
		LDI = 0b0111,
		JC  = 0b1000,
		NOP = 0b1001,
		HLT = 0b1111
	}
}