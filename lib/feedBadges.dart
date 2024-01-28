import 'package:flutter/material.dart';
import 'package:unispace/utils.dart';

class feedHomebadge extends StatefulWidget {
  int index;
  feedHomebadge({Key? key, required this.index}) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
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
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dummy ${widget.index + 1}",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text("Anurag University", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth * 0.42,
              height: screenHeight * 0.12,
              //decoration: Utils.decorationRadiusSS,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            )
          ],
        ),
      ),
    );
  }
}
