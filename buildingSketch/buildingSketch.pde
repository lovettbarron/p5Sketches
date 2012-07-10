int tileWidth = 50;
int tileHeight = 30;
int _scrX = 800;
int _scrY = 800;
int cols = (int)_scrX/tileWidth;
int rows = (int)_scrY/tileHeight;
Building[][] buildings = new Building[cols][rows];

void setup() {
  size(_scrX,_scrY);
  frameRate(5);
  int xCounter = 0;
  int yCounter = 0;
  for(int x=0;x<cols;x++) {
   for(int y=0;y<rows;y++) {
     buildings[x][y] = new Building(x*tileWidth,y*tileHeight,tileWidth,100,boolean(int(random(2))));
   }
  }
}

void draw() {
  background(0);
  drawBuildings();
}

void drawBuildings() {
 int offsetX, offsetY;
 for(int i=0; i < cols; i++) {
  for(int j=0; j < rows; j++) {
    
  if(boolean(i%1)) {
     offsetX = tileWidth / 2;
    } else {
     offsetX = 0; 
    }    
  
   int x = (j * tileWidth) + offsetX;
   int y = i * tileHeight / 2;
   buildings[i][j].draw();
  }
 }
}
