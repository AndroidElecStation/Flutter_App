import 'dart:math';
class BMI
{
  // Constructor
  BMI();

  // Field
  late final int Weight;
  late final int Height;
  late final int Age;
  double bmi = 0;

  //<getters/setters>
  void SetWeight(int weight) {
    // TODO: implement SetWeight
    Weight = weight;
  }
  void SetHeigh(int height) {
    // TODO: implement SetHeigh
    Height = height;
  }
  void SetAge(int age) {
    // TODO: implement SetAge
    Age = age;
  }


  double GetBMI() => bmi;
  String GetResult(){
    if(bmi >= 30)
      return "Obese";
    else if((bmi >= 25) && (bmi < 30))
      return "Over Weight";
    else if ((bmi >= 18.5) && (bmi <25))
      return " Healthy Weight";
    else
      return "Under Weight";
  }
  String GetDetails(){
    if(bmi >= 30)
      return "Take this warning seriously. You are obese . Be sure to see a doctor. We wish you good health.";
    else if((bmi >= 25) && (bmi < 30))
      return "You are overweight. Have a diet and be sure to exercise. We wish you good health.";
    else if ((bmi >= 18.5) && (bmi <25))
      return " excellent. Your weight is perfect. Good luck.";
    else
      return "You are too thin. Go on a diet and see a doctor.";
  }
  String GetAnimationName(){
    if(bmi >= 30)
      return "doctor";
    else if((bmi >= 25) && (bmi < 30))
      return "nutrition";
    else if ((bmi >= 18.5) && (bmi <25))
      return "love-emoji";
    else
      return "burger";
  }

  //<functions>
  void Calculate() {
    // TODO: implement Calculate
    bmi = Weight/(pow((Height/100), 2));
  }

}
