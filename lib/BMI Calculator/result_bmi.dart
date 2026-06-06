//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/BMI%20Calculator/bmiservices.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
    required this.bmiValue,
    required this.advice,
    required this.catogory,
    required this.age,
  });
  final double bmiValue;

  final String advice;
  final String catogory;
  final int age;

  Services bmiService = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191116),
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Result', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              //margin: EdgeInsets.all(7),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Color(0xff251c23),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    catogory,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Age : $age',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${bmiValue.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      advice,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  bmiService.reset();
                  Navigator.pop(context);
                },
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
