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
List<String> socials = ['you.png','ins.jpg','lin.jpg','git.png','dis.png'];
  List<String> skill = ['jav.png','js.png','flu.png','css.jpg','go.jpg'];
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
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              "Profile",
              style: standardFontStyleBlackoriginal,
            ),
          ),
        ),
        leading: Icon(CupertinoIcons.back),
        toolbarHeight: 80.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.16,
              //color: Colors.blue,
              child: Center(
                // child: Container(
                //   width: 100,
                //   height: 100,
                //   color: Colors.yellow,
                //   child: Image.asset('assets/temp/4.jpeg',fit: BoxFit.fill,),
                // ),
                child: CircleAvatar(
                  radius: 70, backgroundImage: AssetImage('assets/temp/4.jpeg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Aymaan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Text(
                "CSE-K",
                style: TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: () {}, child: Text("Follow"),),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(onPressed: () {}, child: Text("Message"),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Bio",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text("Skills",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(top: 10, left: 7),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/temp/${skill[index]}'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text("Socials",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding:const EdgeInsets.only(left:20.0),
              child: Row(
                children: List.generate(
                  4,
                      (index) => Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/temp/${socials[index]}'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text("Pages Owned",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Row(
                children: List.generate(
                  2,
                      (index) => Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/temp/${skill[index]}'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
