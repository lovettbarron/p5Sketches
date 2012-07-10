
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
   displaySide = boolean(int(random(2)));
 }
 
 void draw(boolean offsetTile) {
   updateBuilding((int)random(0,7));
   pushMatrix();

     if(offsetTile) {
       translate(posX+(width/2), posY);
     } else { translate(posX,posY); }
   
     for( int i=0; i<height; i++) {
       noStroke();
       fill(map(i, 0,maxHeight,0,255),255,255);
       quad( 0, (width/2)-i,
             width/2, 0-i,
             width, (width/2)-i,
             width/2, width-i
        );     
     }
     if(hasDisplay) {
       if(displaySide) { //left
        fill(255,0,0);
        quad( 0, (width/2)-height,
             width/2, width-height,
             width/2, (width+(height/8))-height,
             0, ((width/2)+(height/8))-height
        );     
       } else { // right
        fill(0,255,0);
        quad(width/2, (width)-height,
             width, (width/2)-height,
             width, ((width/2)+(height/8))-height,
             width/2, (width+(height/8))-height
        );
       }
     }
    popMatrix();
 }
 
 void updateBuilding(float _incr) {
   if(height<maxHeight) {
     height += _incr;
   }
 }
  
}
