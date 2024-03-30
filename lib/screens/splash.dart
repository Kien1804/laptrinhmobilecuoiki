// import 'package:dangkidangnhap/screen/login.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:dangkidangnhap/screens/loginpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('images/icon.jpg'),
      title: Text(
        'Phúc và Kiên',
        style: TextStyle(
            color: Colors.pink,
            fontFamily:  'ro',
            fontSize: 19,
            fontWeight: FontWeight.bold,
        ),
    ),
      backgroundColor: Colors.grey,
      showLoader: true,
      loaderColor: Colors.pink,
      navigator: loginpage(),
      durationInSeconds: 5,
    );
  }
}

