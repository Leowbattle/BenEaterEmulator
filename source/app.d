import std.stdio;
import ben_eater;

ubyte[16] countTo255 = [
	0b00100011, // Add 1 to regA
	0b01010000, // Output regA
	0b01100000, // JMP to top
	0b00000001 // Gets added to regA
];

// Same as countTo255 but stops when it reaches 255
ubyte[16] stopAt255 = [
	0b00100101, // Add 1 to regA
	0b01010000, // Output regA
	0b10000100, // If carryFlag go to HLT
	0b01100000, // JMP to top
	0b11110000, // HLT
	0b00000001 // This gets added to regA
];

void main() {
	auto computer = new BenEaterEmulator(stopAt255);
	computer.run();
}
