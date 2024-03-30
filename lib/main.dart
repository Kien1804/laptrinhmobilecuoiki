// import 'package:dangkidangnhap/screen/loginpage.dart';
// import 'package:dangkidangnhap/screen/userhomepage.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dangkidangnhap/screens/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(useMaterial3: true),
      // title: 'Kien Va Phuc',
      //   home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return userhomepage();
      //         }else{
      //           return loginpage();
      //         }
      //         },
      // )
    );
  }
}
