Die[] dice = new Die[100];
Die md1 = new Die(175, 150, 50, 50);
Die md2 = new Die(275, 150, 50, 50);
int total;
boolean menu = true;
Button reroll;
Button menuButton;
Button addDice;
Button removeDice;
Button add10;
Button remove10;
Button rollDice;
boolean roll = true;
boolean rollMDice = true;
int numDice = 1;

   void setup(){
      size(500, 550);
      reroll = new Button(450, 505, 45, 40, "Reroll");
      menuButton = new Button(400, 505, 45, 40, "Menu");
      addDice = new Button(255, 300, 95, 40, "+");
      removeDice = new Button(150, 300, 95, 40, "-");
      add10 = new Button(255, 350, 95, 40, "+ 10");
      remove10 = new Button(150, 350, 95, 40, "- 10");
      rollDice = new Button(150, 400, 200, 40, "Roll Dice");
  }
  void draw(){
      background(100);
      if(menu){
        if(rollMDice){
          md1.roll();
          md2.roll();
          rollMDice = false;
        }
        md1.show();
        md2.show();
        addDice.show();
        removeDice.show();
        add10.show();
        remove10.show();
        rollDice.show();
        textAlign(CENTER);
        textSize(25);
        text("Number of Dice: " + numDice, 250, 250);
        textSize(50);
        text("Random Dice Roller", 250, 100);
      }
      else{
        total = 0;
        for(int i = 0; i < numDice; i++){
             Die d = dice[i];
             if(roll){
               d.roll();
             }
             total += d.num;
             d.show();
        }
        roll = false;
        textSize(50);
        textAlign(CENTER);
        fill(0);
        text("Dice total = " + total, 200, 545);
        reroll.show();
        menuButton.show();
      }
  }
  void mousePressed(){
    if(menu){
      if(mouseX >= addDice.x && mouseX <= addDice.x + addDice.sX && mouseY >= addDice.y && mouseY <= addDice.y + addDice.sY && numDice < 100){
         numDice++;
      }
      if(mouseX >= removeDice.x && mouseX <= removeDice.x + removeDice.sX && mouseY >= removeDice.y && mouseY <= removeDice.y + removeDice.sY && numDice > 0){
         numDice--;
      }
      if(mouseX >= add10.x && mouseX <= add10.x + add10.sX && mouseY >= add10.y && mouseY <= add10.y + add10.sY && numDice < 100){
        if(numDice <= 90){
           numDice += 10;
        }
        else{
          numDice = 100;
        }
      }
      if(mouseX >= remove10.x && mouseX <= remove10.x + remove10.sX && mouseY >= remove10.y && mouseY <= remove10.y + remove10.sY && numDice > 1){
         if(numDice >= 10){
           numDice -= 10;
        }
        else{
          numDice = 0;
        }
      }
      if(mouseX >= rollDice.x && mouseX <= rollDice.x + rollDice.sX && mouseY >= rollDice.y && mouseY <= rollDice.y + rollDice.sY){
        initializeDice();
      }
    }
    else{
      if(mouseX >= reroll.x && mouseX <= reroll.x + reroll.sX && mouseY >= reroll.y && mouseY <= reroll.y + reroll.sY){
         roll = true;
      }
      if(mouseX >= menuButton.x && mouseX <= menuButton.x + menuButton.sX && mouseY >= menuButton.y && mouseY <= menuButton.y + menuButton.sY){
        rollMDice = true; 
        menu = true;
      }
    }
  }
  void initializeDice(){
    if(numDice == 0){
      textSize(15);
      text("Please add at least one die", 250, 500);
    }
    else{
      int rows = 0;
        while(rows*rows < numDice){
          rows++;
        }
        
        int counter = 0;
        int xInterval = 500/rows;
        for(int y = 0; y < rows; y += 1){
           for(int x = 0; x < rows; x += 1){
             if(counter < numDice){
               dice[counter] = new Die(x * xInterval, y * xInterval, xInterval, xInterval);
               counter++;
             }
           }
        } 
        menu = false;
        roll = true;
    }
  }
  class Die //models one single dice cube
  {
      int x;
      int y;
      int sX;
      int sY;
      int num;
      int r;
      int g;
      int b;
      Die(int dX, int dY, int xSize, int ySize) //constructor
      {
          x = dX;
          y = dY;
          sX = xSize;
          sY = ySize;
      }
      void roll()
      {
          r = (int)(Math.random() * 255);
          g = (int)(Math.random() * 255);
          b = (int)(Math.random() * 255);
          num = (int)(Math.random() * 6 + 1);
      }
      void show()
      {
          fill(255);
          noStroke();
          rect(x + sX * 1/10, y + sX * 2/10, sX * 8/10, sY * 6/10);
          rect(x + sX * 2/10, y + sX * 1/10, sX * 6/10, sY * 8/10);
          ellipse(x + sX * 2/10, y + sY * 2/10, sX * 2/10, sY * 2/10);
          ellipse(x + sX * 8/10, y + sY * 2/10, sX * 2/10, sY * 2/10);
          ellipse(x + sX * 2/10, y + sY * 8/10, sX * 2/10, sY * 2/10);
          ellipse(x + sX * 8/10, y + sY * 8/10, sX * 2/10, sY * 2/10);
          stroke(1);
          fill(r, g, b);
          if(num == 1){
                ellipse(x + sX/2, y + sY/2, sX/10, sY/10);
          }
          else if(num == 2){
                ellipse(x + sX * 3/10, y + sX * 3/10, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sY * 7/10, sX/10, sY/10);
          }
          else if(num == 3){
                ellipse(x + sX * 3/10, y + sX * 3/10, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sX * 7/10, sX/10, sY/10);
                ellipse(x + sX/2, y + sY/2, sX/10, sY/10);
          }
          else if(num == 4){
                ellipse(x + sX * 3/10, y + sX * 3/10, sX/10, sY/10);
                ellipse(x + sX * 3/10, y + sX * 7/10, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sX * 3/10, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sX * 7/10, sX/10, sY/10);
          }
          else if(num == 5){
                ellipse(x + sX * 3/10, y + sX * 3/10, sX/10, sY/10);
                ellipse(x + sX * 3/10, y + sX * 7/10, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sX * 3/10, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sX * 7/10, sX/10, sY/10);
                ellipse(x + sX/2, y + sY/2, sX/10, sY/10);
          }
          else{
                ellipse(x + sX * 3/10, y + sY * 3/10, sX/10, sY/10);
                ellipse(x + sX * 3/10, y + sY * 1/2, sX/10, sY/10);
                ellipse(x + sX * 3/10, y + sY * 7/10, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sY * 3/10, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sY * 1/2, sX/10, sY/10);
                ellipse(x + sX * 7/10, y + sY * 7/10, sX/10, sY/10);
          }
      }
}
class Button{
  int x;
  int y;
  int sX;
  int sY;
  String bText;
  boolean isPressed = false;
  Button(int pX, int pY, int sizeX, int sizeY, String buttonText){
    x = pX;
    y = pY;
    sX = sizeX;
    sY = sizeY;
    bText = buttonText;
  }
  void show(){
    if(mouseX >= x && mouseX <= x + sX && mouseY >= y && mouseY <= y + sY){
      fill(125);
    }
    else{
      fill(150);
    }
    rect(x, y, sX, sY);
    fill(0);
    textSize(15);
    textAlign(CENTER);
    text(bText, x + sX/2, y + sY * 5/8);
  }
}
