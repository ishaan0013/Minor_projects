import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'reuseable_column.dart';
import 'final_const.dart';
import 'outputpage.dart';

enum Changecolor {
  formale,
  forfemale,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color male = inactivecolor;
  Color female = inactivecolor;
  int height = 1;
  int weight = 40;
  int age = 1;

  void updatecolor(Changecolor c) {
    c == Changecolor.formale ? male = activecolours : female = activecolours;
    c == Changecolor.formale ? female = inactivecolor : male = inactivecolor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(
                        () {
                          updatecolor(Changecolor.formale);
                        },
                      );
                    },
                    colour: male,
                    cardChild: ReuseableColumn(
                      icons: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        updatecolor(Changecolor.forfemale);
                      });
                    },
                    colour: female,
                    cardChild: ReuseableColumn(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: activecolours,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: textstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberstyle,
                      ),
                      Text(
                        'FEET',
                        style: textstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      overlayColor: Color(0x40EB1555),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.blueGrey,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 18.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 35.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 1.0,
                      max: 15.0,
                      onChanged: (double newvalue) {
                        setState(
                          () {
                            height = newvalue.round();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: activecolours,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: textstyle,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberstyle,
                            ),
                            Text(
                              'KG',
                              style: textstyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) {
                                    weight--;
                                  } else {
                                    weight = 1;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: activecolours,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: textstyle,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  } else {
                                    age = 1;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLbuttonstyle,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFF0167),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 5.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
    );
  }
}
