import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'homepage.dart';


void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => Splash()),
      GetPage(name: '/login', page: () => Login()),
    ],
  )
  );
}

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {

  static const  String LOGINSTATE ='login';
  static const  String JWT_TOKEN = 'token';

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    navhome();
  }
  navhome()async{
    //await Future.delayed(const Duration(milliseconds: 3500),(){});
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn =  sharedPref.getBool(LOGINSTATE);
    var JWT = sharedPref.getString(JWT_TOKEN);
    Timer(
      Duration(seconds: 3),
          () {
        if (isLoggedIn != null) {
          if (isLoggedIn == true) {
            Get.offAll(Homepage());
          } else {
            Get.offAll(Login());
          }
        } else {
          Get.offAll(Login());
        }
      },
    );

  }
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 150 * fem,
              height: 150 * fem,
              child: Image.asset(
                'assets/images/logo_try.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Lottie.asset('assets/load_lottie.json',
              width: 100,
              height: 60)
        ],
      ),
    );
  }
}
