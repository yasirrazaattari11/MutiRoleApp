import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_role_application/home_screen.dart';
import 'package:multi_role_application/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();

  }
  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('isLogin') ?? false;
    if(islogin){
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff000221),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 320),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image(
                      image: AssetImage('assets/logof.png'),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Welcome To Connect Me!!',
                        style: GoogleFonts.satisfy(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
