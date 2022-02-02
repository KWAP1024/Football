// ignore_for_file: empty_constructor_bodies, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print, override_on_non_overriding_member, deprecated_member_use, unnecessary_string_interpolations
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
// import 'package:tanzanian_premier_league/homepage.dart';
// import 'package:tanzanian_premier_league/pesa/mpesa.dart';
import 'package:tanzanian_premier_league/pesa/mpesacheck.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone, {Key? key}) : super(key: key);
  //  OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  var _verificationCode;
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP VERIFICATION'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify this Phone number ${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              withCursor: true,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 55.0,
              eachFieldHeight: 55.0,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Post(),
                    ));
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState!.showSnackBar(SnackBar(content: Text('Inavalid OTP')));
                }
              },
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
            ),
          )
        ],
      ),
    );
  }
//  '+255${widget.phone}'
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Post(),
                    ));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String _verificationID, var resendToken) {
          setState(() {
            _verificationCode = _verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String _verficationID) {
          setState(() {
            _verificationCode = _verficationID;
          });
        },
        timeout: Duration(seconds: 100));
  }
  

  @override
  void initState() {
    _verifyPhone();
    super.initState();
  }
}
