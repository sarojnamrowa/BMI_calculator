import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//enum Gender { male, female }

class ColumWidget extends StatelessWidget {
  const ColumWidget({
    super.key,
    required this.icon,
    required this.gender,
    required this.color,
  });
  final IconData icon;
  final String gender;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, color: Colors.white, size: 50),
          SizedBox(height: 5),
          Text(gender, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
