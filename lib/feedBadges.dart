import 'package:flutter/material.dart';
class feedHomebadge extends StatefulWidget {
  const feedHomebadge({super.key});

  @override
  State<feedHomebadge> createState() => _feedHomebadgeState();
}

class _feedHomebadgeState extends State<feedHomebadge> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.45,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
      ),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
