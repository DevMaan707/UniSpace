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
    List<String> prof = [
      '1.jpg',
      '2.jpg',
      '3.jpg',
      '4.jpeg',
      '5.jpeg','6.jpeg','7.jpeg'
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        CupertinoIcons.back,
                        size: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Computer Science',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'K',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Members',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: List.generate(
                          7,
                          (index) => Padding(
                            padding: EdgeInsets.only(top: 10, left: 5),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:AssetImage('assets/temp/${prof[index]}'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                  padding: const EdgeInsets.only(left: 20.0, top: 30),
                  child: Text("Class Incharge",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20,top:10),
                child: Row(
                  children: [
                    Row(
                      children: List.generate(
                        1,
                        (index) => Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:AssetImage('assets/temp/${prof[1]}'),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Name',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Qualifications',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30),
                child: Text("Lecturers",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:25.0,top:10),
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage:AssetImage('assets/temp/${prof[index+1]}'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 40),
                child: Text("Deadlines",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 10),
                child: Text("No deadlines as of now",
                    style:
                    TextStyle(fontSize: 18, ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 40),
                child: Text("Todays Schedule",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
