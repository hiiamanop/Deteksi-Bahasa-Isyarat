import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sign_language/views/detection.dart';
import 'package:sign_language/views/preview.dart';
import 'package:sign_language/widgets/constant.dart';
import 'package:sign_language/widgets/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds and then navigate to the home page
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) =>
              HomePage(), // Ensure HomePage is properly instantiated
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("asset/images/logo_app.jpg")),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Your home page content goes here
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Image.asset(
              'asset/images/3707683 1.png',
              height: 400,
              width: 400,
            ),
            Column(
              children: [
                Container(
                  width: 250,
                  child: Text(
                    'Deteksi Bahasa Isyarat',
                    style: mainTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [secondaryColor, primaryColor]),
                      borderRadius: BorderRadius.circular(50)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviewPage()));
                    },
                    child: Container(
                      width: 130,
                      child: Row(
                        children: [
                          Text('Get Started', style: buttonStyle),
                          SizedBox(width: 10),
                          Image.asset(
                            'asset/images/Vector.png',
                            width: 24,
                            height: 28,
                          )
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
