import 'bottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: standardFontStyleBlackoriginal,
        ),
        leading: Icon(CupertinoIcons.back),
      ),
    );
  }
}
