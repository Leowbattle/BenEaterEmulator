import std.stdio;
import ben_eater;

ubyte[16] countTo255 = [
	0b_0010_0011, // Add 1 to regA
	0b_0101_0000, // Output regA
	0b_0110_0000, // JMP to top
	0b_0000_0001 // Gets added to regA
];

// Same as countTo255 but stops when it reaches 255
ubyte[16] stopAt255 = [
	0b_0010_0101, // Add 1 to regA
	0b_0101_0000, // Output regA
	0b_1000_0100, // If carryFlag go to HLT
	0b_0110_0000, // JMP to top
	0b_1111_0000, // HLT
	0b_0000_0001 // This gets added to regA
];

void main() {
	auto computer = new BenEaterEmulator(stopAt255);
	computer.run();
}
