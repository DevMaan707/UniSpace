import 'package:flutter/material.dart';
import 'package:unispace/utils.dart';

class feedHomebadge extends StatefulWidget {
  const feedHomebadge({super.key});

  @override
  State<feedHomebadge> createState() => _feedHomebadgeState();
}

class _feedHomebadgeState extends State<feedHomebadge> {
  List<String> prof = [
    '1.jpg',
    '2.jpg',
    '3.jpg',
    '4.jpeg',
    '5.jpeg',
    '6.jpeg',
    '7.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.45,
      height: screenHeight * 0.2,
      decoration: Utils.decorationRadiusSS,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Dummy 1"), Text("Anurag University")],
              ),
            ],
          )
        ],
      ),
    );
  }
}
