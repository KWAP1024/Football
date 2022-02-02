// ignore_for_file: constant_identifier_names, avoid_unnecessary_containers, unnecessary_null_comparison, prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tanzanian_premier_league/countries/england/fixtureskn.dart';
import 'package:tanzanian_premier_league/countries/germany/fixturesu.dart';
import 'package:tanzanian_premier_league/countries/spain/fixturesr.dart';
import 'package:tanzanian_premier_league/countries/tanzania/fixturestz.dart';
import 'package:tanzanian_premier_league/main.dart';
import 'package:tanzanian_premier_league/news/germany.dart';
import 'package:tanzanian_premier_league/news/homepage.dart';
import 'package:tanzanian_premier_league/news/spain.dart';
import 'dart:convert';
import 'package:tanzanian_premier_league/youtube/screens/youtube.dart';

void main() {
  runApp(const En());
}

bool isLoading = false;

class En extends StatefulWidget {
  const En({Key? key}) : super(key: key);

  @override
  EnState createState() => EnState();
}

class EnState extends State<En> {
  void startTimer() {
    Timer.periodic(const Duration(seconds: 75), (t) {
      setState(() {
        isLoading = false;
      });
      t.cancel();
    });
  }

  String stringResponse = '';
  List listResponse = [];
  Map mapResponse = {};
  Map mapOfFacts = {};
  List listOfFacts = [];

  // Map maphome = {};

  Future fetchData() async {
    http.Response response;
    const API_URL = 'https://news-api20.herokuapp.com/store.php';
    response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      setState(() {
        listOfFacts = json.decode(response.body);
        // listOfFacts = mapOfFacts['fixtures'];
        // mapResponse = mapOfFacts['data'];
        // listResponse = mapResponse['fixtures'];
        // // maphome = listResponse[home_name];
      });
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
          title: const Text(
            'WELCOME',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 90),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        IconButton(
                        hoverColor: Colors.blueGrey,
                        iconSize: 80,
                        color: Colors.yellow.shade700,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => En(),
                              ));
                        },
                        icon: Icon(Icons.sports_soccer)
                      ),
                       Text('Tanzania'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [                       
                      IconButton(
                        hoverColor: Colors.blueGrey,
                        iconSize: 80,
                        color: Colors.yellow.shade700,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => En(),
                              ));
                        },
                        icon: Icon(Icons.sports_soccer)
                      ),
                       Text('England'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        IconButton(
                        hoverColor: Colors.blueGrey,
                        iconSize: 80,
                        color: Colors.yellow.shade700,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Sp(),
                              ));
                        },
                        icon: Icon(Icons.sports_soccer)
                      ),
                        Text('Spain'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                       IconButton(
                        hoverColor: Colors.blueGrey,
                        iconSize: 80,
                        color: Colors.yellow.shade700,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Gn(),
                              ));
                        },
                        icon: Icon(Icons.sports_soccer)
                      ),
                        Text('Germany'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
      drawer: Drawer(
        child: Container(
            // color: Colors.white,
            child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            // child: Icon(Icons.person,size: 10.0,color: Colors.black,),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/caf.jfif'),
            ),
          ),
          ListTile(
              tileColor: Colors.blue,
              leading: const CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/caf.jfif'),
              ),
              title: const Text('Football news'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Homepage(),
                    ));
              }),
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('assets/tz.png'),
              ),
              title: const Text('Tanzania'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Fixturestz(),
                    ));
              }),
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('assets/kn.png'),
              ),
              title: const Text('England'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Fixtureskn(),
                    ));
              }),
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('assets/ug.png'),
              ),
              title: const Text('Germany'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Fixturesu(),
                    ));
              }),
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('assets/rw.png'),
              ),
              title: const Text('Spain'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Fixturesr(),
                    ));
              }),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.live_tv,
                color: Colors.white,
                // add custom icons also
              ),
            ),
            title: const Text('Highlights'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Youtube()));
            },
          ),
          ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(MyApp.themeNotifier.value == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode),
              ),
              title: const Text('Theme'),
              onTap: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              }),
        ])),
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
                            Text('Finding news available',
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
                RefreshIndicator(
                  color: Colors.blue,
                  onRefresh: _refresh,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blue.shade400,
                        borderOnForeground: true,
                        shadowColor: Colors.blue,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  width: double.infinity,
                                  child: Image.network(
                                    listOfFacts[index]['url'].toString(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    listOfFacts[index]['news'].toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ), //livescore-api.com/api-client/fixtures/matches.json?competition_id=80&key=de0YMjttm1cqWuft&secret=hK3cwKwZmt1YxfVLtVKgeeJAfW1brgFI
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                      listOfFacts[index]['youtube'].toString()),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: listOfFacts == null ? 0 : listOfFacts.length,
                  ),
                ),
              ],
            )),
    );
  }
}
