// ignore_for_file: unnecessary_null_comparison, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tanzanian_premier_league/countries/england/fixtureskn.dart';
import 'package:tanzanian_premier_league/countries/germany/fixturesu.dart';
import 'package:tanzanian_premier_league/countries/germany/historyu.dart';
import 'package:tanzanian_premier_league/countries/germany/leagueu.dart';
import 'package:tanzanian_premier_league/countries/spain/fixturesr.dart';
import 'package:tanzanian_premier_league/countries/tanzania/fixturestz.dart';
import 'package:tanzanian_premier_league/news/homepage.dart';
import 'dart:convert';
import 'package:tanzanian_premier_league/main.dart';
import 'package:tanzanian_premier_league/youtube/screens/youtube.dart';

void main() {
  runApp(const Livescoreu());
}

class Livescoreu extends StatefulWidget {
  const Livescoreu({Key? key}) : super(key: key);

  @override
  LivescoreuState createState() => LivescoreuState();
}

class LivescoreuState extends State<Livescoreu> {
  Map mapResponse = {};
  Map mapOfFacts = {};
  List listOfFacts = [];

  // Map maphome = {};

  Future fetchData() async {
    http.Response response;
    const API_URL =
        'https://livescore-api.com/api-client/scores/live.json?competition_id=1&key=85C1LvsbG45sNOKv&secret=upUelWkmrvK3T9H2fj40PwcvBhYp6IUA';
    response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        mapOfFacts = mapResponse['data'];
        listOfFacts = mapOfFacts['match'];
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 90),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fixturesu()));
                          },
                          child: Icon(
                            Icons.auto_graph_sharp,
                            color: Colors.white,
                            // add custom icons also
                          ),
                        ),
                        Text('Fixtures'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Livescoreu()));
                          },
                          child: Icon(
                            Icons.account_tree_outlined,
                            color: Colors.indigo[900],
                            // add custom icons also
                          ),
                        ),
                        Text('Livescore'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Leagueu()));
                          },
                          child: Icon(
                            Icons.align_horizontal_left_sharp,
                            color: Colors.white,
                            // add custom icons also
                          ),
                        ),
                        Text('League'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Historyu()));
                          },
                          child: Icon(
                            Icons.history_edu,
                            color: Colors.white,
                            // add custom icons also
                          ),
                        ),
                        Text('History'),
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
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('assets/ug.png'),
            ),
          ),
          ListTile(
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
              tileColor: Colors.blue,
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Youtube()));
                    },),
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
              padding: const EdgeInsets.only(top:280.0),
              child: Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 1,
                    ),
                    Text(
                        'Finding Matches Available',
                        style: TextStyle(color: Colors.blue),
                      ),
                  ],
                ),
              ),
            ),
          )
          : RefreshIndicator(
              color: Colors.blue,
              onRefresh: _refresh,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  // Card(child: Text(mapResponse['success'].toString())),
                  RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Card(
                            color: Colors.blue,
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
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        listOfFacts[index]['home_name']
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Text(
                                        listOfFacts[index]['away_name']
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                    listOfFacts[index]['score'].toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  listOfFacts[index]['status'].toString(),
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  listOfFacts[index]['location'].toString(),
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(0),
                              //   child: Text(listOfFacts[index]['date'].toString()),
                              // ),
                            ],
                          ),
                        );
                      },
                      itemCount: listOfFacts == null ? 0 : listOfFacts.length,
                    ),
                  )
                ],
              )),
            ),
    );
  }
}
