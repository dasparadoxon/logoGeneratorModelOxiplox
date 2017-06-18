/*

This is just for documentation. It contains the pixel sizes of the original logo and calculates 
relative size and color RGB percentages which then are used in the logoGenerator

perhaps a direct bridge would be nice in the future, so that you can change the elements in groups relative
to each other etc.

*/

double circle1size = 272; 
double circle2size = 261;
double circle3size = 241;
double circle4size = 229;
double circle5size = 146;
double circle6size = 136;

double Circle1Procentage;
double Circle2Procentage;
double Circle3Procentage;
double Circle4Percentage;
double Circle5Percentage;
double Circle6Percentage;

double imageSize = 84;

double imageSizeDiffPercentage;

double imageShadowDiffPercentage = 0.8648648648648649;

color baseColor = color(117, 159, 176); // #759fb0

color secondCircleColor = color(19, 56, 70); // #143a49
color thirdCircleColor = color(124, 205, 225); // #7ccde1
color circle4Color = color(52, 152, 190); // #3498be
color circle6Color = color(58, 58, 58); // #3a3a3a

color halfCircle1Color = color(74, 169, 200);
color halfCircle2Color = color(28, 116, 162);

PVector diffBaseSecondCircleColor;
PVector diffBaseThirdCircleColor;
PVector diffBase4CircleColor;
PVector diffBase6CircleColor;

void calculateRelativeWidths() {

  println("Percentages");
  println();

  Circle1Procentage = 1.0f;

  Circle2Procentage = circle2size / circle1size;

  println("Second Circle Procentage is : " + Circle2Procentage);

  Circle3Procentage = circle3size / circle1size;

  println("Third Circle Procentage is : " + Circle3Procentage);

  Circle4Percentage = circle4size / circle1size;

  println("Forth Circle Procentage is : " + Circle4Percentage);    

  Circle5Percentage = circle5size / circle1size;

  println("Fifth Circle Procentage is : " + Circle5Percentage); 

  Circle6Percentage = circle6size / circle1size;

  println("Fifth Circle Procentage is : " + Circle6Percentage);
  
  Circle6Percentage = circle6size / circle1size;

  println("Sixth Circle Procentage is : " + Circle6Percentage);
  
  imageSizeDiffPercentage = imageSize / circle1size;
  
  println("imageSizeDiffPercentage is : " + imageSizeDiffPercentage);

  // COLORS

  println();
  println("COLORS");
  println();

  diffBaseSecondCircleColor = calculateSimpleColorPercentages(baseColor, secondCircleColor);

  println("diffBaseSecondCircleColor:"+diffBaseSecondCircleColor.toString());

  diffBaseThirdCircleColor = calculateSimpleColorPercentages(baseColor, thirdCircleColor);

  println("diffBaseThirdCircleColor: "+diffBaseThirdCircleColor.toString());   

  diffBase4CircleColor = calculateSimpleColorPercentages(baseColor, circle4Color);

  println("diffBase4CircleColor: "+diffBase4CircleColor.toString());  

  diffBase6CircleColor = calculateSimpleColorPercentages(baseColor, circle6Color);

  println("diffBase6CircleColor: "+diffBase6CircleColor.toString());      

  diffBase6CircleColor = calculateSimpleColorPercentages(baseColor, circle6Color);

  println("diffBase6CircleColor: "+diffBase6CircleColor.toString());  



  println("halfCircle1Color: "+calculateSimpleColorPercentages(baseColor, halfCircle1Color).toString());      
  println("halfCircle2Color: "+calculateSimpleColorPercentages(baseColor, halfCircle2Color).toString());
  
  
}

PVector calculateSimpleColorPercentages(color c1, color c2) {


  float red = red(c2)/red(c1);
  float green = green(c2)/green(c1);
  float blue = blue(c2)/blue(c1);

  return new PVector(red, green, blue);
}

double ColourDistance(color c1, color c2)
{
  double rmean = ( red(c1) + red(c2) )/2;
  float r = red(c1) - red(c2);
  float g = green(c1) - green(c2);
  float b = blue(c1) - blue(c2);
  double weightR = 2 + rmean/256;
  double weightG = 4.0;
  double weightB = 2 + (255-rmean)/256;
  return Math.sqrt(weightR*r*r + weightG*g*g + weightB*b*b);
} 