// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanzanian_premier_league/news/homepage.dart';
import 'package:tanzanian_premier_league/login.dart';
// import 'package:tanzanian_premier_league/pesa/mpesacheck.dart';

var finalphone;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatortohome();
  }

  _navigatortohome() async {
    await getValidationData().whenComplete(() async {
      await Future.delayed(Duration(seconds: 15), () {});
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => finalphone == null ? Loginscreen() : Homepage()));
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obatinphone = sharedPreferences.get('phone');
    setState(() {
      finalphone = obatinphone;
    });
    print(finalphone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextStyle(
            style: GoogleFonts.pacifico( textStyle: TextStyle (
              color: Colors.white,
              fontSize: 32.0,
            ),),
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  'TANZANIA'
                ),
                FadeAnimatedText('PREMIUM'),
                FadeAnimatedText('LEAGUE'),
              ],
            ),
          ),
          Lottie.asset(
            'assets/splash.json',
            width: 200,
            height: 200,
          ),
        ],
      )),
    );
  }
}
