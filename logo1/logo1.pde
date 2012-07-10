PFont p;

int[] logoCol = {
	0,0,0
};


float[][] triA = {
	{.5,0},
	{0,1},
	{1,1},
	{.5,0}
};

float[][] triL = {
	{.25,.5},
	{.75,.5},
	{1,1},
	{0,1},
	{.25,.5}
};

float[][] triB = {
	{.75,.5},
	{.5,1},
	{.75,1},
	{.625,.75},
	{.875,.75},
	{.75,.5}
};


float[][] point = {
	{.5,0},
	{1,1},
	{0,1},
	{.25,.5},
	{.75,.5},
	{.5,1},
	{.75,1},
	{.666,.75}
};


void setup() {
	size(800,800);
	background(255);
	p = loadFont("Osaka-48.vlw");
	colorMode(HSB);
	frameRate(10);
}

void draw() {
	fill(logoCol[0],255,255);
	beginShape();
	for(int i = 0; i < triA.length; i++) {
		vertex(triA[i][0]*screen.width/2,triA[i][1]*screen.height/2);
	}
	endShape();
	
	fill(logoCol[1],255,255);
	beginShape();
	for(int i = 0; i < triL.length; i++) {
		vertex(triL[i][0]*screen.width/2,triL[i][1]*screen.height/2);
	}
	endShape();
	
	fill(logoCol[2],255,255);
		beginShape();
	for(int i = 0; i < triB.length; i++) {
		vertex(triB[i][0]*screen.width/2,triB[i][1]*screen.height/2);
	}
	endShape();
	
	
}

void drawTriangle(int x1, int y1, int x2, int y2, int x3, int y3) {
	fill(random(150,220),255,255);
	triangle(x1, y1, x2, y2, x3, y3);
}



/*
for(int x = 0; x < screen.width/2; x=x+100) {
	for(int y = 0; y < screen.height/2; y=y+100 ) {
		noStroke();
		pushMatrix();
		rotate(random(0,90));
		drawTriangle(x,y,x,y+100,x+100,y+100);		
		popMatrix();
	}
}

for(int x = 0; x < screen.width/2; x=x+100) {
	for(int y = 0; y < screen.height/2; y=y+100 ) {
		drawTriangle(x,y,x,y+100,x+100,y+100);		
		stroke(.4);
		pushMatrix();
		rotate(random(0,90));
		drawTriangle(x,y,x,y+100,x+100,y+100);		
		popMatrix();
	}
}
*/


void keyPressed() {
	char pressed = key;
	switch(pressed) {
		case 'q':
			logoCol[0]++;
			break;
		case 'w':
			logoCol[0]--;
			break;
		case 'a':
			logoCol[1]++;
			break;
		case 's':
			logoCol[1]--;
			break;
		case 'z':
			logoCol[2]++;
			break;
		case 'x':
			logoCol[2]--;
			break;
	}
	
	
	
	
	
	
}