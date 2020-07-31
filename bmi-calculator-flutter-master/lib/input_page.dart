import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'card_reusable.dart';
import 'package:intl/intl.dart';

import 'package:flutter_material_pickers/flutter_material_pickers.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  var date = DateTime.now();
//  var minDate = DateTime().year;

  var selectedUsState = "Connecticut";

  List<String> usStates = <String>[
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'სავარძლის არჩევა',
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'bpg_nino_mtavruli_bold',
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardReusable(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'ბიჭი',
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardReusable(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'გოგო',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardReusable(
                      colour: activeCardColour,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardReusable(
                      onPress: () {
                        setState(() {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now(),
                            helpText: 'აირჩიე ბავშვის დაბადების თარიღი:',
                            builder: (BuildContext context, Widget child) {
                              return Theme(
                                data: ThemeData.dark().copyWith(
                                  colorScheme: ColorScheme.dark(
                                    primary: activeCardColour,
                                    onPrimary: Colors.white,
                                    surface: activeCardColour,
                                    onSurface: Colors.white,
                                    onBackground: Colors.yellowAccent,
                                  ),
                                  dialogBackgroundColor: inactiveCardColour,
                                  backgroundColor: Colors.green,
                                  brightness: Brightness.dark,
                                  buttonTheme: ButtonThemeData(
                                      textTheme: ButtonTextTheme.accent),
//                                 nst IconThemeData(color: Colors.red),
                                ),
                                child: child,
                              );
                            },
                          );
                        });
                      },
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.calendarAlt,
                        label: 'დაბადების თარიღი',
                      ),
                      colour: activeCardColour,
                    ),
                  ),
                  Expanded(
                    child: CardReusable(
                      colour: activeCardColour,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
