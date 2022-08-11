import 'package:bmi_calculator/bmi_calculate.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_icon_button.dart';
import '../const_values.dart';
import '../components/iconContent.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bmi_calculator/bmi_calculate.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? Selected_Gender;
  int _Height = 120, _Wieght = 50, _Age = 20;
  int TempHeight = 0;
  bool _isFinished = false;
  BMI bmi = BMI();
  // void onFinish() {
  //       ()async {
  //     await Navigator.push(context, PageTransition(
  //         child: ResultPage(), type: PageTransitionType.fade));
  //
  //     setState(() {
  //       _isFinished = false;
  //     });
  //   };
  // }
  void onWaitingProcess() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isFinished = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbde0fe),
      appBar: AppBar(
        backgroundColor: Color(0xffcdb4db),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Selected_Gender = Gender.Male;
                      });
                      print(Selected_Gender);
                    },
                    color: Selected_Gender == Gender.Male
                        ? ACTIVE_BUTTON_COLOR
                        : INACTIVE_BUTTON_COLOR,
                    CardChild: icon_content(
                      icon: FontAwesomeIcons.mars,
                      text: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Selected_Gender = Gender.Female;
                      });
                      print(Selected_Gender);
                    },
                    color: Selected_Gender == Gender.Female
                        ? ACTIVE_BUTTON_COLOR
                        : INACTIVE_BUTTON_COLOR,
                    CardChild: icon_content(
                      icon: FontAwesomeIcons.venus,
                      text: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          //============================================================
          Expanded(
            child: ReusableCard(
              onPress: () {},
              color: INACTIVE_BUTTON_COLOR,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: BUTTON_TEXT_STYLE,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _Height.toString(),
                        style: NUMBER_TEXT_STYLE,
                      ),
                      Text(
                        "cm",
                        style: BUTTON_TEXT_STYLE,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 10,
                          elevation: 10,
                        ),
                        activeTrackColor: ICON_COLOR,
                        thumbColor: ICON_COLOR,
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20)),
                    child: Slider(
                      min: 0,
                      max: 230,
                      divisions: 230,
                      value: _Height.toDouble(),
                      onChanged: (NewValue) {
                        setState(() {
                          _Height = NewValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          //============================================================
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {});
                      },
                      color: INACTIVE_BUTTON_COLOR,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Wieght",
                            style: BUTTON_TEXT_STYLE,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _Wieght.toString(),
                            style: NUMBER_TEXT_STYLE,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      _Wieght--;
                                      if (_Wieght < 0) _Wieght = 0;
                                    });
                                  }),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.add,
                                onPress: () {
                                  setState(() {
                                    _Wieght++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {},
                      color: INACTIVE_BUTTON_COLOR,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: BUTTON_TEXT_STYLE,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _Age.toString(),
                            style: NUMBER_TEXT_STYLE,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      _Age--;
                                      if (_Age < 0) _Age = 0;
                                    });
                                  }),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.add,
                                onPress: () {
                                  setState(() {
                                    _Age++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwipeableButtonView(
              isFinished: _isFinished,
              onFinish: () async {
                bmi.SetAge(_Age);
                bmi.SetWeight(_Wieght);
                bmi.SetHeigh(_Height);
                bmi.Calculate();
                await Navigator.push(
                    context,
                    PageTransition(
                        child: ResultPage(bmi: bmi.GetBMI(), Result: bmi.GetResult(), Details: bmi.GetDetails(), Animation_Name: bmi.GetAnimationName()),
                        type: PageTransitionType.fade));

                setState(() {
                  _isFinished = false;
                });
              },
              onWaitingProcess: onWaitingProcess,
              activeColor: INACTIVE_BUTTON_COLOR,
              buttonWidget: Icon(FontAwesomeIcons.forward),
              buttonText: "Calculate",
              buttontextstyle: BUTTON_TEXT_STYLE,
            ),
          ),
        ],
      ),
    );
  }
}


