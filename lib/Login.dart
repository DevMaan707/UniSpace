import 'homepage.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/auth_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Login_body(),
    );
  }
}

class Login_body extends StatefulWidget {
  Login_body({super.key});

  @override
  State<Login_body> createState() => _Login_bodyState();
}

class _Login_bodyState extends State<Login_body> {
  Auth loginDetails = Auth();
  //Auth loginDetails = Auth();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.1,
              ),
              SizedBox(
                width: 100 * fem,
                height: 100 * fem,
                child: Image.asset(
                  'assets/images/logo_try.png',
                  fit: BoxFit.fill,
                  width: double.infinity, // To make sure the image takes the full width
                  height: double.infinity,
                ),
              ),
              const Text(
                'UNI SPACE',
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),


              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Your onPressed logic here
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjust the padding as needed
                      child: Text(
                        'Students',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20,),
                  InkWell(
                    onTap: () {
                      // Your onPressed logic here
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjust the padding as needed
                      child: Text(
                        'Faculty',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: const OutlineInputBorder(),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.deepOrangeAccent),
                            borderRadius: BorderRadius.circular(
                                15), // Change the color for focused state
                          ),
                          //border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: const OutlineInputBorder(),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.deepOrangeAccent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top:10,bottom: 20),child: Text('Forgot Password',style: TextStyle(decoration: TextDecoration.underline,color: Colors.blueAccent,decorationColor: Colors.blueAccent),),),
              OutlinedButton(
                onPressed: () async {
                  //print(emailController.text);
                  var token = await loginDetails.authenticaton(
                      emailController.text, passwordController.text);

                  if (token != null) {
                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setString(SplashState.JWT_TOKEN, token);
                    sharedPref.setBool(SplashState.LOGINSTATE,true);
                    Get.to(Homepage());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid Credentials'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(screenWidth * 0.7, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set your desired border radius here
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top:10,bottom: 20),child: Text('Dont have an account? ',style: TextStyle(),),),

                  Padding(padding: EdgeInsets.only(top:10,bottom: 20),child: Text('Signup',style: TextStyle(decoration: TextDecoration.underline,decorationColor: Colors.blueAccent,color: Colors.blueAccent),),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
