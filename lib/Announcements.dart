import 'package:flutter/material.dart';
import 'package:unispace/utils.dart';
class announcements extends StatefulWidget {
  int index;
   announcements({Key? key, required this.index}):super(key:key);

  @override
  State<announcements> createState() => _announcementsState();
}

class _announcementsState extends State<announcements> {
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
                      "Respected ${widget.index + 1}",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text("Dean, CSE", style: TextStyle(fontSize: 10)),
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
                  color: Colors.grey.shade200, borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',style: TextStyle(fontSize: 10)),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
