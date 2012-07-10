int tileWidth = 50;
int tileHeight = 50;
int _scrX = 1000;
int _scrY = 600;
int streetWidth = 10;
int cols = (int)_scrX/tileWidth;
int rows = (int)_scrY/tileHeight;
Building[][] buildings = new Building[cols][rows];

void setup() {
  size(_scrX,_scrY);
  frameRate(10);
  int xCounter = 0;
  int yCounter = 0;
  for(int x=0;x<cols;x++) {
   for(int y=0;y<rows;y++) {
     streetWidth = int(random(10));
     buildings[x][y] = new Building(
       (x*tileWidth)+streetWidth,
       (y*tileHeight)+streetWidth,
       tileWidth,
       150,
       boolean(int(random(2)))
      );
   }
  }
}

void draw() {
  background(10);
  drawBuildings();
}

void drawBuildings() {
 for(int i=0; i < cols; i++) {
  for(int j=0; j < rows; j++) {
   buildings[i][j].draw(boolean(i%1));
  }
 }
}
