import std.stdio;
import ben_eater;

// Count to 255
ubyte[16] program = [
	0b00100011,
	0b01010000,
	0b01100000,
	0b00000001
];

void main() {
	auto computer = new BenEaterEmulator(program);
	computer.run();
}
