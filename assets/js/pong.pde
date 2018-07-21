//variables pour le pad

int paddle_width = 5;   //largeur du pad
int paddle_height = 18; //hauteur du pad
int dist_wall = 15;     //distance entre le pad et le mur

//variables pour la balle

float ball_x; //float pour le déplacement verticale
float ball_y; //float pour le déplacement horizontal
float ball_dir = 1;
float ball_size = 5;   //radius de la balle

void setup()

{

size(200,200) //taille de la page
rectMode(CENTER_RADIUS);
ellipseMode(CENTER_RADIUS);
noStroke();
smooth();
ball_y = height/2;
ball_x = 1;

}

//dessin

void draw()

background(51);
ball_x += ball_dir *1.0;
ball_y += dy;
if(ball_x > width+ball_size) {
ball_x = -width/2 - ball_size;
ball_y = random(0, height);
dy = 0;
}

//contenir le pad dans l'écran

float paddle_y = constrain(mouseY, paddle_height, height-paddle_height);

//tester si la balle touche le pad pour la renvoyé

float py = width-dist_wall-paddle_width-ball_size;
if(ball_x == py
  && ball_y > paddle_y - paddle_height - ball_size
  && ball_y < paddle_y + paddle_height + ball_size
  ){
  ball_dir *= -1;
  if(mouseY != pmouseY){
  dy = (mouseY-pmouseY)/2.0;
  if(dy > 5) { dy = 5; }
  if(dy < -5) { dy = -5; }
  }
  }


//si la balle touche le mur aprés le pad renvoyé la ball au point de départ
if(ball_x)
