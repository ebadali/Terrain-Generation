

int WIDTH = 1200;
int HEIGHT = 900;
int scale = 20;
int col, row;
float noiseValues [][] ;
float cameraValue  =0;
void setup()
{
  size(600 ,600, P3D);
  
  row = HEIGHT / scale;
  col = WIDTH / scale;  
  
  noiseValues = new float [col][row];
  


}


void draw()
{
  cameraValue -= 0.08;
  float yOff = cameraValue;


  for(int y = 0 ; y < row ; y++)
      {                
          float xOff = 0;
          for(int x = 0 ; x < col; x++)
          {          
             //noiseValues[x][y] = random(-10,10);
                          noiseValues[x][y] = map(noise(xOff , yOff),0,1, -150, 150) ;
              xOff += 0.1;      
          }          
          yOff += 0.1;
      }
  background(0);  
  stroke(255);                          
  noFill(); 
  
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-WIDTH/2,-HEIGHT/2);


      for(int y = 0 ; y < row -1; y++)
      {        
          beginShape(TRIANGLE_STRIP);
          for(int x = 0 ; x < col; x++)
          {          
            vertex(x*scale,y*scale,noiseValues[x][y]);
            vertex(x*scale,(y+1)*scale, noiseValues[x][y+1]);
          }
          endShape();    
      }
}
  
 