// ignore_for_file: constant_identifier_names, avoid_unnecessary_containers, unnecessary_null_comparison, prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, void_checks

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tanzanian_premier_league/news/homepage.dart';

void main() {
  runApp(const Mpesa());
}

bool isLoading = false;

class Mpesa extends StatefulWidget {
  const Mpesa({Key? key}) : super(key: key);

  @override
  MpesaState createState() => MpesaState();
}

class MpesaState extends State<Mpesa> {
  void startTimer() {
    Timer.periodic(const Duration(seconds: 75), (t) {
      setState(() {
        isLoading = false;
      });
      t.cancel();
    });
  }

  String stringResponse = '';
  String code = '';
  List listResponse = [];
  Map mapResponse = {};
  Map mapOfFacts = {};
  List listOfFacts = [];

  // var _code = TextEditingController();
  // TextEditingController _code = TextEditingController();
  final myController = TextEditingController();
  // var _code2 = new TextEditingController();

  Future fetchData() async {
    http.Response response;
    const API_URL = 'https://mpesa-app.herokuapp.com/store.php';
    response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      setState(() {
        listOfFacts = json.decode(response.body);
      });
      // return check();
    } //
  }

  Future<void> _refresh() async {}
  // The list that contains information about photos
  @override
  void initState() {
    fetchData();
    startTimer();
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        bottomOpacity: 1.0,
        toolbarOpacity: 1.0,
        toolbarHeight: 100,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            // bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(70),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: listOfFacts.isEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 280.0),
                child: isLoading
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                              color: Colors.blue,
                              strokeWidth: 1,
                            ), //show this if state is loading
                            Text(
                              "Loading....",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(
                              color: Colors.blue,
                              strokeWidth: 1,
                            ),
                            Text('Loading...',
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
              children: [
                // Card(child: Text(mapResponse['success'].toString())),
                Text('Subscription Paymanet'),
                IconButton(
                        hoverColor: Colors.blueGrey,
                        iconSize: 80,
                        onPressed: () {
                        },
                        icon: Image.asset(
                          'assets/mpesa.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                Text('Go to Mpesa menu'),
                Text('Send Money(1)'),
                Text('Enter number'),
                Text('0754758644'),
                Text('Copy the code'),
                RefreshIndicator(
                  color: Colors.blue,
                  onRefresh: _refresh,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 200),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Code',
                                    fillColor: Colors.blue,
                                  ),
                                  maxLength: 10,
                                  controller: myController,
                                ),
                              ),
                              SizedBox(
                                width: 290,
                                child: ElevatedButton(
                                    onPressed: () {
                                      for (var i = 0; i < 1; i++) {
                                        if (myController.text == listOfFacts[index]['code'].toString()) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => Homepage()));
                                        } else {
                                          AlertDialog(
                                              title: const Text(
                                                  'AlertDialog Title'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text('Wrong Code.'),
                                                    Text('Please insert again'),
                                                  ],
                                                ),
                                              ));
                                        }
                                      }
                                    },
                                    child: Text('Submit')),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 1,
                  ),
                ),
              ],
            )),
    );
  }
}
