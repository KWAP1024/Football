// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanzanian_premier_league/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            // title: 'Kindacode.com',https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfUva4KTKLDKJRCdW0zeL1Olbm0Xs9Rwv6Vw&usqp=CAU
            // https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfgzjwrAk3rxM0tD8JVftYThg7Szvi4dUzRA&usqp=CAU
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.dosisTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: Splash(),
            // home: AnimatedSplashScreen(
            //   splash: Column (
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //        Text('kwayu'),
            //       Lottie.asset('assets/splash.json',
            //   width: 200,
            //   height: 165,
            //   ),

            //   // splash: Icons.home,

            //   // splashTransition: SplashTransition.rotationTransition,
            //   // pageTransitionType: PageTransitionType.scale,

            //   ]),
            //    nextScreen: const Language(),
            //   duration: 7000,
            //   backgroundColor: Colors.lightGreen,

            // )
          );
        });
  }
}
