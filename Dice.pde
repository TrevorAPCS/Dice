Section[] sections = new Section[4];
int total;
boolean menu = true;
Button reroll;
Button menuButton;
Button addSection;
Button removeSection;
Button rollDice;
int numSections = 1;
boolean initializeSections = true;

   void setup(){
      size(500, 600);
      reroll = new Button(450, 555, 45, 40, "Reroll");
      menuButton = new Button(400, 555, 45, 40, "Menu");
      addSection = new Button(130, 555, 115, 40, "Add Section");
      removeSection = new Button(5, 555, 115, 40, "Remove Section");
      rollDice = new Button(255, 555, 240, 40, "Roll Dice");
  }
  void draw(){
      background(75);
      if(menu){
        if(initializeSections == true){
          int rows = 0;
          while(rows*rows < numSections){
            rows++;
          }
          int counter = 0;
          int sInterval = 500/rows;
          for(int y = 0; y < rows; y += 1){
            for(int x = 0; x < rows; x += 1){
              if(counter < numSections){
                sections[counter] = new Section(1, x * sInterval, y * sInterval * 11/10, sInterval);
                counter++;
              }
            }
          }
        }
        initializeSections = false;
        for(int i = 0; i < numSections; i++){
          Section s = sections[i];
          s.show();
        }
        addSection.show();
        removeSection.show();
        rollDice.show();
        textAlign(CENTER);
        textSize(25);
      }
      else{
        total = 0;
        for(int i = 0; i < numSections; i++){
          Section s = sections[i];
          s.show();
          total += s.total;
        }
        textSize(40);
        textAlign(CENTER);
        fill(0);
        text("Dice total = " + total, 200, 595);
        reroll.show();
        menuButton.show();
      }
  }
  void mousePressed(){
    for(int i = 0; i < numSections; i++){
      Section s = sections[i];
      s.checkMouseClick();
    }
    if(menu){
      if(mouseX >= rollDice.x && mouseX <= rollDice.x + rollDice.sX && mouseY >= rollDice.y && mouseY <= rollDice.y + rollDice.sY){
        menu = false;
      }
      if(mouseX >= addSection.x && mouseX <= addSection.x + addSection.sX && mouseY >= addSection.y && mouseY <= addSection.y + addSection.sY && numSections < 4){
         numSections++;
         initializeSections = true;
      }
      if(mouseX >= removeSection.x && mouseX <= removeSection.x + removeSection.sX && mouseY >= removeSection.y && mouseY <= removeSection.y + removeSection.sY && numSections > 1){
         numSections--;
         initializeSections = true;
      }
    }
    else{
      if(mouseX >= reroll.x && mouseX <= reroll.x + reroll.sX && mouseY >= reroll.y && mouseY <= reroll.y + reroll.sY){
         for(int i = 0; i < numSections; i++){
           Section s = sections[i];
           s.rollDice();
        }
      }
      if(mouseX >= menuButton.x && mouseX <= menuButton.x + menuButton.sX && mouseY >= menuButton.y && mouseY <= menuButton.y + menuButton.sY){
        menu = true;
      }
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
  String text;
  boolean isPressed = false;
  Button(int pX, int pY, int sizeX, int sizeY, String buttonText){
    x = pX;
    y = pY;
    sX = sizeX;
    sY = sizeY;
    text = buttonText;
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
    text(text, x + sX/2, y + sY * 2/3);
  }
}
class Section{
  Die[] dice;
  Button reroll;
  Button addDice;
  Button removeDice;
  Button add10;
  Button remove10;
  int nDice;
  int x;
  int y;
  int size;
  int total;
  Section(int numD, int pX, int pY, int s){
    nDice = numD;
    x = pX;
    y = pY;
    size = s;
    dice = new Die[nDice];
    int rows = 0;
    while(rows*rows < nDice){
      rows++;
    }
    int counter = 0;
    int sInterval = size/rows;
    for(int dY = 0; dY < rows; dY += 1){
      for(int dX = 0; dX < rows; dX += 1){
        if(counter < dice.length){
           dice[counter] = new Die(x + dX * sInterval, y + dY * sInterval, sInterval, sInterval);
           counter++;
        }
      }
    }
    reroll = new Button(x + size * 30/40, y + size, size * 7/30, size * 1/12, "Reroll");
    addDice = new Button(x + size * 21/40, y + size * 3/5, size * 2/10, size * 2/25, "+");
    removeDice = new Button(x + size * 11/40, y + size * 3/5, size * 2/10, size * 2/25, "-");
    add10 = new Button(x + size * 21/40, y + size * 7/10, size * 2/10, size * 2/25, "+ 10");
    remove10 = new Button(x + size * 11/40, y + size * 7/10, size * 2/10, size * 2/25, "- 10");
    rollDice();
  }
  void initializeDice(){
    dice = new Die[nDice];
    int rows = 0;
    while(rows*rows < nDice){
      rows++;
    }
    int counter = 0;
    int sInterval = size/rows;
    for(int dY = 0; dY < rows; dY += 1){
      for(int dX = 0; dX < rows; dX += 1){
        if(counter < dice.length){
           dice[counter] = new Die(x + dX * sInterval, y + dY * sInterval, sInterval, sInterval);
           counter++;
        }
      }
    }
    rollDice();
  }
  void rollDice(){
    total = 0;
    for(int i = 0; i < dice.length; i++){
      Die die = dice[i];
      die.roll();
      total += die.num;
    }
  }
  void show(){
    fill(100);
    rect(x, y, size, size * 11/10);
    if(menu){
      textSize(15);
      textAlign(CENTER);
      fill(0);
      text("Dice: " + nDice, size/2 + x, size/2 + y);
      addDice.show();
      removeDice.show();
      add10.show();
      remove10.show();
    }
    else{
      fill(100);
      for(int i = 0; i < dice.length; i++){
        Die die = dice[i];
        die.show();
      }
      reroll.show();
      fill(0);
      textAlign(CENTER);
      textSize(25);
      text("total: " + total, x + size / 2, y + size * 15/14);
    }
  }
  void checkMouseClick(){
    if(menu){
      if(mouseX >= addDice.x && mouseX <= addDice.x + addDice.sX && mouseY >= addDice.y && mouseY <= addDice.y + addDice.sY && nDice < 100){
        nDice++;
        initializeDice();
      }
      if(mouseX >= removeDice.x && mouseX <= removeDice.x + removeDice.sX && mouseY >= removeDice.y && mouseY <= removeDice.y + removeDice.sY && nDice > 1){
        nDice--;
        initializeDice();
      }
      if(mouseX >= add10.x && mouseX <= add10.x + add10.sX && mouseY >= add10.y && mouseY <= add10.y + add10.sY && nDice < 100){
        if(nDice <= 90){
          nDice += 10;
        }
        else{
          nDice = 100;
        }
        initializeDice();
      }
      if(mouseX >= remove10.x && mouseX <= remove10.x + remove10.sX && mouseY >= remove10.y && mouseY <= remove10.y + remove10.sY && nDice > 1){
        if(nDice >= 10){
          nDice += 10;
        }
        else{
          nDice = 1;
        }
        initializeDice();
      }
    }
    else{
      if(mouseX >= reroll.x && mouseX <= reroll.x + reroll.sX && mouseY >= reroll.y && mouseY <= reroll.y + reroll.sY){
        rollDice();
      }
    }
  }
}
