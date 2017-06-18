class Logo {

  float toolCanvasXOffset = 145;

  PImage img;

  float imageSize = 50;

  float imgTaintAlphaValue = 50;
  float imgTaintValue = 14;

  float imageShadowDiffPercentage = 0.8648648648648649f;

  float topFontArclength = 32;

  String[] fontList;

  int fontIndex = 0;
  int numberOfFontsOnSystem = 0;

  PFont f;

  String logoText = "Gustatus Similis Pullus";

  float circle1 = 1.0f;  
  float circle2 = 0.9233716475095786f;
  float circle3 = 0.8773946360153256f;
  float circle4 = 0.8419117647058824f;
  float circle5 = 0.5593869731800766f;
  float circle6 = 0.5f; 

  float imageSizePercentage = 0.3088235294117647f;


  //color baseColor = color(117, 159, 176);

  color baseColor = color(224, 44, 24);

  color circleColor1 = color(255, 255, 255);
  color circleColor2 = baseColor;
  color circleColor3 = baseColor;
  color circleColor4 = color(255, 255, 255);
  color circleColor5 = color(255, 255, 255);
  color circleColor6 = color(255, 255, 255);

  //color halfCircleColor1 = color(74,169,200);

  color[] circleColors = new color[]{circleColor1, circleColor2, circleColor3, circleColor4, circleColor5, circleColor6};

  float[] circles = new float[]{circle1, circle2, circle3, circle4, circle5, circle6};

  PVector[] circleColorDiffToBaseColor = new PVector[]{

    null, 
    new PVector(0.16239317, 0.35220125, 0.39772728), 
    new PVector(1.0598291, 1.2893082, 1.2784091), 
    new PVector(0.44444445, 0.9559748, 1.0795455), 
    null, 
    new PVector(0.4957265, 0.36477986, 0.32954547)

  };

  PVector[] halfCirclesHalfTransparentPercentage = new PVector[]{

    new PVector(0.63247865, 1.062893, 1.1363636), 
    new PVector(0.23931624, 0.7295597, 0.92045456)

  };

  int indexAtWhichCircleOrderPositionTheHalfCircleHasToBeDrawn = 4;
  int indexAtWhichTheImagesHasToBeDrawn = 5;

  float size;

  Logo(float sizeOfLogo) {

    size = sizeOfLogo;

    fontList = PFont.list();

    numberOfFontsOnSystem = fontList.length;

    //printArray(fontList);

    createCurrentFont(50, 20);

    img = loadImage("testLogo.png");
  }

  void userInterfaceStuff() {

    pushStyle();



    fill(100);

    rect(20, 20, width * 0.67, height -40);

    fill(100);

    rect(width * 0.6 + 110, 20, width * 0.27, height -40);  
    
    fill(232);

    rect(width * 0.6 + 110 + 10, 15 + 60 + 250, 216, 120);

    popStyle();
  }

  void createCurrentFont(int fontSize, int fontIndex) {


    f = createFont(fontList[fontIndex], fontSize, true);
    textFont(f);
    // The text must be centered!
    textAlign(CENTER);
    smooth();

    println("Using Font "+fontList[fontIndex]);
  }

  void draw() {

    userInterfaceStuff();

    drawCircles(); 

    drawFonts();
  }

  void drawImages() {

    //pushStyle();
    ///pushMatrix();

    //translate(width/2, height/2);

    pushStyle();

    tint(imgTaintValue, imgTaintAlphaValue);

    float shadowOffset = (size * imageSizePercentage) * ( 1 - imageShadowDiffPercentage);

    float rectangleVisualCorrectionOffset = 28;

    //println("Shadow Offset : "+shadowOffset);

    image(img, -(size * imageSizePercentage / 2) + shadowOffset, -(size * imageSizePercentage / 2)+ shadowOffset - rectangleVisualCorrectionOffset, size * imageSizePercentage, size * imageSizePercentage);

    popStyle();

    image(img, -(size * imageSizePercentage / 2), -(size * imageSizePercentage / 2)- rectangleVisualCorrectionOffset, size * imageSizePercentage, size * imageSizePercentage);

    //popMatrix();
    //popStyle();
  }

  void drawHalfTransparentHalfCircle() {



    color fillColor;

    float red = red(baseColor) * halfCirclesHalfTransparentPercentage[0].x;
    float green = green(baseColor) * halfCirclesHalfTransparentPercentage[0].y;
    float blue = blue(baseColor) * halfCirclesHalfTransparentPercentage[0].z;

    fillColor = color(red, green, blue);

    fill(fillColor);

    arc(0, 0, size * circle3, size * circle3, 0, PI, CHORD);

    red = red(baseColor) * halfCirclesHalfTransparentPercentage[1].x;
    green = green(baseColor) * halfCirclesHalfTransparentPercentage[1].y;
    blue = blue(baseColor) * halfCirclesHalfTransparentPercentage[1].z;    

    fillColor = color(red, green, blue);

    fill(fillColor);

    arc(0, 0, size * circle4, size * circle4, 0, PI, CHORD);
  }

  void drawCircles() {

    pushStyle();
    pushMatrix();

    translate(width/2 - toolCanvasXOffset, height/2);

    noStroke();

    //fill(baseColor);
    //rect(-width/2 + 20, -height/2+ 20, 44, 44);

    int colorCircleIndex = 0;

    for (float percentage : circles) {

      color fillColor = color(0, 0, 0);

      if (circleColorDiffToBaseColor[colorCircleIndex] != null) {

        float red = red(baseColor) * circleColorDiffToBaseColor[colorCircleIndex].x;
        float green = green(baseColor) * circleColorDiffToBaseColor[colorCircleIndex].y;
        float blue = blue(baseColor) * circleColorDiffToBaseColor[colorCircleIndex].z;

        fillColor = color(red, green, blue);
      } else {

        fillColor = circleColors[colorCircleIndex];
      }

      if (colorCircleIndex == indexAtWhichCircleOrderPositionTheHalfCircleHasToBeDrawn)
        drawHalfTransparentHalfCircle();



      fill(fillColor);

      ellipse(0, 0, size * percentage, size * percentage);


      if (colorCircleIndex == indexAtWhichTheImagesHasToBeDrawn)
        drawImages();      

      colorCircleIndex++;
    }

    popMatrix();
    popStyle();
  }

  void drawFonts() {

    pushStyle();
    pushMatrix();

    translate(width/2 - toolCanvasXOffset, height/2);

    float r = (circle5 * size) / 2 + 40;

    String upperCaseLogoText = logoText.toUpperCase();

    // We must keep track of our position along the curve

    float arclength = topFontArclength;

    // For every box
    for (int i = 0; i < upperCaseLogoText.length(); i++)
    {
      // Instead of a constant width, we check the width of each character.
      char currentChar = upperCaseLogoText.charAt(i);
      float w = textWidth(currentChar);

      // Each box is centered so we move half the width
      arclength += w/2;
      // Angle in radians is the arclength divided by the radius
      // Starting on the left side of the circle by adding PI
      float theta = PI + arclength / r;    

      pushMatrix();
      // Polar to cartesian coordinate conversion
      translate(r*cos(theta), r*sin(theta));
      // Rotate the box
      rotate(theta+PI/2); // rotation is offset by 90 degrees
      // Display the character
      fill(255);
      text(currentChar, 0, 0);
      popMatrix();
      // Move halfway again
      arclength += w/2;
    }

    popMatrix();
    popStyle();
  }
}