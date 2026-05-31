import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'service_bmi.dart';

enum Gender { male, female }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int height = 150;
  final Color highlighted = Color(0xff120d11);
  final Color unhighlighted = Color(0xff251c23);
  Gender? selectedGender;
  int weight = 50;
  int age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191116),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI Calculator', style: TextStyle(color: Colors.white)),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ColumWidget(
                      icon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                      color: selectedGender == Gender.male
                          ? highlighted
                          : unhighlighted,
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ColumWidget(
                      icon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                      color: selectedGender == Gender.female
                          ? highlighted
                          : unhighlighted,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              height: 170,
              width: double.infinity,
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Color(0xff251c23),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$height',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              // width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(7),
                      height: 160,

                      decoration: BoxDecoration(
                        color: Color(0xff251c23),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black87,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icon(Icons.remove, color: Colors.white),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.black87,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icon(Icons.add, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(7),
                      height: 160,

                      decoration: BoxDecoration(
                        color: Color(0xff251c23),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black87,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: Icon(Icons.remove, color: Colors.white),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.black87,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: Icon(Icons.add, color: Colors.white),
                                ),
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
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {},
                child: Center(child: Text('CALCULATE')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
