import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unispace/utils.dart';

import 'Announcements.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  var usrDetails;
  var courseId = [];
  var courseDetails = {};
  var cover = "";
  var avatar = "";
  var userName;
  var user;

  late Future<void> dataFetching = fetchData();

  @override
  void initState() {
    super.initState();
    //dataFetching = fetchData();
  }

  Future<void> fetchData() async {
    //usrDetails = await usr.userDetails();
    // cover = usrDetails['data']['user_data']['cover'];
    // avatar = usrDetails['data']['user_data']['avatar'];
    //userName = usrDetails['data']['user_data']['first_name'] +
    //   " " +
    //  usrDetails['data']['user_data']['last_name'];
    //user = usrDetails['data']['user_data']['username'];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<void>(
        future: dataFetching,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for data
            return Center(child: Lottie.asset('assets/loading.json'));
          } else if (snapshot.hasError) {
            // Handle errors
            return Center(child: Text('Error loading data'));
          } else {
            // Data has been loaded, proceed with building the UI
            return buildHomePage(screenWidth, screenHeight);
          }
        },
      ),
    );
  }

  Widget buildHomePage(double screenWidth, double screenHeight) {
    var standardFontStyleBlack = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
    var standardFontStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
    var standardFontStyleBlackoriginal = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23);
    var standardFontStyleoriginal =
        TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold);
    List<String> v = [
      'Notify leave',
      'Class Announcements',
      'Handouts',
      'Assessments'
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                  Text(
                    'Feeds',
                    style: standardFontStyleBlackoriginal,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(CupertinoIcons.mail, size: 25),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20),
              child: Row(
                children: [
                  Text(
                    "Announcements",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      'See all',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (index) => const Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 18),
                    child: announcements(),
                  ),
                ),
              ),
            ),
            Column(
              children: List.generate(6, (index) => Padding(
                padding: const EdgeInsets.only(top:10.0,bottom: 20),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.4,
                  decoration: Utils.decorationRadiusSS,
                ),
              ),)


            )
          ],
        ),
      ),
    );
  }
}
