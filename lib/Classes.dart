import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unispace/utils.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.back,
                        size: 30,
                      ),
                      Text(
                        'Computer Science',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'K',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Members',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.only(top: 10, left: 5),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Container(
                      height: 50,
                      decoration: Utils.decoration,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(v[index]),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Container(
                      height: 50,
                      decoration: Utils.decoration,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(v[index + 2]),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text("Class Incharge",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      1,
                          (index) => Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Text('Name',),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Text('Qualifications',),
                      ),
                    ],
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Text("Lecturers",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Row(
                children: List.generate(
                  5,
                      (index) => Padding(
                    padding: EdgeInsets.only(top: 10, left: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Text("Todays Schedule",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
