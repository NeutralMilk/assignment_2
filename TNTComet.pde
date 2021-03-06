class TNTComet extends GameObject
{
  float thetaDir;
  TNTComet()
  {
    super(random(0, width), random(0, height), 50);    
    c = color(255, 0, 0);
    f = 0;
    mine = true;
    forward.x = random(-1, 1);
    forward.y = random(-1, 1);
    forward.normalize();
    thetaDir = random(-0.015f, 0.015f);
    sides = (int)random(3,10);
    size = (int)random(15,40);
  }
  
  // From the interface. This class won't compile unless it has this method  

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);    
    fill(f);
    stroke(c);
    strokeWeight(3);
    polygon(0, 0, size, sides); 
    popMatrix();
  }//end render()
  
  void polygon(float x, float y, float size, int sides) 
  {
    float angle = TWO_PI / sides;
    beginShape();
    for (float i = 0; i < TWO_PI; i += angle) 
    {
      float newX = x + cos(i) * size;
      float newY = y + sin(i) * size;
      vertex(newX, newY);
    }//end for
    
    endShape(CLOSE);
  }//end polygon()
  
  void update()
  {
    theta += thetaDir;
    
    pos.add(forward);
    if (pos.x < 0)
    {
       pos.x = width;
    }//end if
    
    if (pos.x > width)
    {
      pos.x = 0;
    }//end if
    
    if (pos.y < (height/10)/2)
    {
      pos.y = height;
    }//end if
    
    if (pos.y > height)
    {
      pos.y = (height/10)/2;
    }//end if
    
    if (pos.x + size > width - sideLength - border && pos.x - size < width - border && pos.y + size > height/2 - sideLength/2 && pos.y - size < height/2 + sideLength/2)
    {
       pos.x = 0;
       pos.y = 0;
    }//end if
   }//end update()
}//end class