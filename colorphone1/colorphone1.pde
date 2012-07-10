//Processing code for this example
// Dimmer - sends bytes over a serial port
// by David A. Mellis
//This example code is in the public domain.

import processing.serial.*;
Serial port;
int r, g, b;

void setup() {
	size(800, 800);
	frameRate(10);
	loadPixels();
	println("Available serial ports:");
	println(Serial.list());

	// Uses the first port in this list (number 0).  Change this to
	// select the port corresponding to your Arduino board.  The last
	// parameter (e.g. 9600) is the speed of the communication.  It
	// has to correspond to the value passed to Serial.begin() in your
	// Arduino sketch.
	port = new Serial(this, Serial.list()[0], 9600);  

	// If you know the name of the port used by the Arduino board, you
	// can specify it directly like this.
	//port = new Serial(this, "COM1", 9600);
}

void draw() {
	// draw a gradient from black to white
	r = int(map(mouseX, 0, width, 0, 255) );
	g = int (map(mouseY, 0, height, 0, 255) );
	b = int( map(mouseY, 0, height, 0, 255) );
	
		for (int i = 0; i < width-1; i++) {
			for(int j = 0; j < height-1; j++){
				color c = color(
					int( map(i, 0, width, 0, 255) ),
					int( map(j, 0, height, 0, 255) ),
					int( map(j, 0, height, 0, 255) )
					);
				int loc = i + (j * width);
				pixels[loc] = c;
			}
	}
	updatePixels();

	// write the current X-position of the mouse to the serial port as
	// a single byte
	r = int(map(mouseX, 0, width, 0, 255) );
	g = int (map(mouseY, 0, height, 0, 255) );
	b = int( map(mouseY, 0, height, 0, 255) );
	println("r" + r + "g" + g + "b" + b + "c");
//	port.write("r" + r + "g" + g + "b" + b + "c");
	port.write('r');
	port.write(r);
	port.write('g');
	port.write(g);
	port.write('b');
	port.write(b);
	port.write('c');
}

