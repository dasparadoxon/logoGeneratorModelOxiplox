/***
 
 GENERIC LOGO GENERATOR MODEL "OXIPLOX"
 
 @VERSION 0.2
 
 I saw a logo for a python project and thought that I could write a quick generator for this type of 
 logo. 
 
 Just for practice. Use it or learn from it or drink a good cup of coffee.
 
 Take care, dasparadoxon in 2017
 
 // Uses Processing and the fabolous ControlP5 UI Elements library 
 // (http://www.sojamo.de/libraries/controlP5/)
 
 */

int start_time; 


/* CONTROLL P5 */

import controlP5.*;

ControlP5 cp5;

ColorPicker cp;

ColorWheel cw;

Slider s;
Slider imgTaintAlphaValueSlider;
Slider imgTaintValueSlider;

/* VARIABLES */

Logo newLogo;

/* METHODS */

void setup() {

  start_time=millis(); 

  size(1000, 800);

  println( PFont.list());

  calculateRelativeWidths();

  newLogo = new Logo(630);

  PFont labelFont = createFont(newLogo.fontList[20], 12, true);

  cp5 = new ControlP5(this);

  // ? cp5.setColorLabel(0xffdddddd);

  cp = cp5.addColorPicker("picker")
    .setPosition(width * 0.6 + 110 + 10, 20 + 10)
    .setColorValue(newLogo.baseColor)
    .setSize(200, 100)
    ;

  //cp = new ColorPicker(cp5, cp5.getDefaultTab( ) ,"TEST" , 0 , 0 , 255 , 10); 

  cw = cp5.addColorWheel("baseColorWheelHandlerFunction")
    .setPosition(width * 0.6 + 110 +10, 10 +20 + 70)
    .setLabel("BASE COLOR WHEEL")
    ;

  int sliderSize = 100;
  int xNegativeOffset =  120;
  int yOffset = 270 +60 ;

  Label label;

  s = cp5.addSlider("fontArc")
    .setPosition(width - sliderSize - xNegativeOffset - sliderSize / 2, 10 + yOffset)
    .setSize(sliderSize, sliderSize / 10)
    .setRange(0, 360)
    .setValue(newLogo.topFontArclength)
    .setLabel("FONT TOP")
    ;  

  label= s.getCaptionLabel();
  label.setColor(0);    
  label.setFont(labelFont);

  imgTaintAlphaValueSlider    = cp5.addSlider("imgTaintAlphaValueSliderHandlerFunction")
    .setLabel("T.IMAGE ALPHA")

    .setPosition(width - sliderSize - xNegativeOffset - sliderSize / 2, yOffset+  10 + ((sliderSize / 10) * 4 ))
    .setSize(sliderSize, sliderSize / 10)
    .setRange(0, 360)
    .setValue(newLogo.imgTaintAlphaValue)
    ;   
  label= imgTaintAlphaValueSlider.getCaptionLabel();
  label.setColor(0);
  label.setFont(labelFont);

  imgTaintValueSlider    = cp5.addSlider("imgTaintValueSliderHandlerFunction")
    .setLabel("TAINT IMAGE")

    .setPosition(width - sliderSize - xNegativeOffset - sliderSize / 2, yOffset+  10 + ((sliderSize / 10) * 2 ))
    .setSize(sliderSize, sliderSize / 10)
    .setRange(0, 360)
    .setValue(newLogo.imgTaintValue)
    ;   
  label= imgTaintValueSlider.getCaptionLabel();
  label.setColor(0);
  label.setFont(labelFont);
}


void fontArc(float theColor) {


  if (preventInitialEventFiringHack()) {
    return;
  } 
  newLogo.topFontArclength = theColor;
  //map(theColor,0f,128f,0f,360f);

  //
  println("a slider event. setting background to "+theColor);
}

void imgTaintAlphaValueSliderHandlerFunction(float theNewAplha) {

  if (preventInitialEventFiringHack()) {
    return;
  }  

  newLogo.imgTaintAlphaValue = theNewAplha;
}

void imgTaintValueSliderHandlerFunction(float theNewTaintValue) {

  if (preventInitialEventFiringHack()) {
    return;
  } 

  newLogo.imgTaintValue = theNewTaintValue;
}

boolean preventInitialEventFiringHack() {

  if (millis()-start_time<1000) {
    return true;
  }
  return false;
}

void baseColorWheelHandlerFunction(int col) {

  if (preventInitialEventFiringHack()) {
    return;
  } 

  newLogo.baseColor = col;

  //println("baseColorWheelHandlerFunction\talpha:"+alpha(col)+"\tred:"+red(col)+"\tgreen:"+green(col)+"\tblue:"+blue(col)+"\tcol"+col);
}

public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if (c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    int a = int(c.getArrayValue(3));
    color col = color(r, g, b, a);

    newLogo.baseColor = col;

    //println("event\talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
  }
}



void picker(int col) {
  //println("picker\talpha:"+alpha(col)+"\tred:"+red(col)+"\tgreen:"+green(col)+"\tblue:"+blue(col)+"\tcol"+col);
}

void draw() {

  background(64);

  newLogo.draw();
}