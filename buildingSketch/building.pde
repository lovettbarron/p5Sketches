
class Building {
 int height;
 int maxHeight;
 int tileWidth;
 int posX;
 int posY;
 boolean hasDisplay;
 boolean displaySide;
 float displayWalk;
  
 Building(int _x, int _y, int _width, int _maxHeight, boolean _disp) {
   maxHeight = _maxHeight;
   height = 0;
   tileWidth = _width;
   posX = _x;
   posY = _y;
   hasDisplay = _disp;
   displaySide = boolean(int(random(2)));
 }
 
 void draw(boolean offsetTile) {
   updateBuilding((int)random(0,7));
   pushMatrix();
     if(offsetTile) {
       translate(posX+(tileWidth/2), posY);
     } else { translate(posX,posY); }
   
     for( int i=0; i<height; i++) {
       colorMode(RGB);       
       if( i==height-1 ) {
         noStroke();
         fill(map(i, 0,maxHeight,0,255),255,255);
         quad( 0, (tileWidth/2)-height,
               tileWidth/2, 0-height,
               tileWidth, (tileWidth/2)-height,
               tileWidth/2, tileWidth-height
          );     
       } else {
         stroke(map(i, 0,maxHeight,0,255),255,255);
         line( 0, (tileWidth/2)-i,
               tileWidth/2, tileWidth-i);
         line( tileWidth/2, tileWidth-i,
               tileWidth, (tileWidth/2)-i ); 
       }
       
     }
   /*  colorMode(RGB);
     noStroke();
     fill(map(height, 0,maxHeight,0,255),255,255);
     quad( 0, (tileWidth/2)-height,
           tileWidth/2, 0-height,
           tileWidth, (tileWidth/2)-height,
           tileWidth/2, tileWidth-height
           );
     fill(map(height, 0,maxHeight,0,255),255,255);
     quad ( 0, (tileWidth/2)-height, //left side
           tileWidth/2, 0-height,
           tileWidth/2, 0
           0,tileWidth/2
           );
     fill(map(height, 0,maxHeight,0,255),255,255);
     quad ( 0, (tileWidth/2)-height, //right side
           tileWidth/2, 0-height,
           tileWidth/2, 0
           0,tileWidth/2
           );
     */
      
      drawDisplay(hasDisplay,displaySide,displayWalk);
     
    popMatrix();
 }
 
 void updateBuilding(float _incr) {
   if(height<maxHeight) {
     height += _incr;
   }
   displayWalk = (displayWalk + int(random(10)))%255;
 }
  
 void drawDisplay(boolean _hasDisplay, boolean _displaySide, float _displayWalk) {
   
   
   colorMode(HSB);
     if(_hasDisplay) {
       if(_displaySide) { //left
        fill(_displayWalk,127,255);
        quad( 0, (tileWidth/2)-height,
             tileWidth/2, tileWidth-height,
             tileWidth/2, (tileWidth+(height/8))-height,
             0, ((tileWidth/2)+(height/8))-height
        );     
       } else { // right
        fill(_displayWalk,127,255);
        quad(tileWidth/2, (tileWidth)-height,
             tileWidth, (tileWidth/2)-height,
             tileWidth, ((tileWidth/2)+(height/8))-height,
             tileWidth/2, (tileWidth+(height/8))-height
        );
       }
     }
 } 
}
