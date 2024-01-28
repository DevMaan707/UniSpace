import 'package:flutter/material.dart';

class Utils{
  static var decoration =  BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(0.5, 0.5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(-0.5, -0.5),
          blurRadius: 15,
          spreadRadius: 1,
        )
      ],
    );
  static var decorationRadiusSS =  BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        offset: const Offset(0.5, 0.5),
        blurRadius: 15,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Colors.grey.shade300,
        offset: const Offset(-0.5, -0.5),
        blurRadius: 15,
        spreadRadius: 1,
      )
    ],
  );

}