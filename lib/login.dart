// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanzanian_premier_league/otp.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                child: Center(
                  child: Text('Phone Authentication'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Start +255',
                  ),
                  maxLength: 13,
                  keyboardType: TextInputType.phone,
                  controller: _controller,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(90.0),
                                    side: BorderSide(color: Colors.blue)))),
                onPressed: () async {
                   final SharedPreferences sharedPreferences =
                       await SharedPreferences.getInstance();
                   sharedPreferences.setString('phone', _controller.text);
                  //  Get.to();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => OTPScreen(_controller.text)));
                },
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
