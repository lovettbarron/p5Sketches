
class Building {
 int height;
 int maxHeight;
 int width;
 int posX;
 int posY;
 boolean hasDisplay;
 boolean displaySide;
  
 Building(int _x, int _y, int _width, int _maxHeight, boolean _disp) {
   maxHeight = _maxHeight;
   height = 0;
   width = _width;
   posX = _x;
   posY = _y;
   hasDisplay = _disp;
   displaySide = boolean(int(random(0,1)));
 }
 
 void draw() {
   updateBuilding((int)random(0,10));
   pushMatrix();
   translate(posX, posY);
   for( int i=0; i<height; i++ ) {
   quad( 0, width/2+height,
         width/2, 0+height,
         width, width/2+height,
         width/2, width+height
    );     
   }
    popMatrix();
 }
 
 void updateBuilding(float _incr) {
   if(height<maxHeight) {
     height += _incr;
   }
 }
 
 int x() {
  return posX; 
 }
 
 int y() {
  return posY; 
 }
  
}
