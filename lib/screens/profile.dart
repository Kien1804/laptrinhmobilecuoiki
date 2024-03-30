import 'package:dangkidangnhap/screens/chuakhadung.dart';
import 'package:dangkidangnhap/screens/deleteaccout.dart';
import 'package:dangkidangnhap/screens/messenger.dart';
import 'package:dangkidangnhap/screens/note.dart';
import 'package:dangkidangnhap/screens/resetpass.dart';
import 'package:dangkidangnhap/screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  Profil({super.key});

  @override
  List<Icon> icons = [
    Icon(Icons.password, color: Colors.redAccent),
    Icon(Icons.delete, color: Colors.redAccent),
    Icon(Icons.note_add, color: Colors.redAccent),
    Icon(Icons.baby_changing_station_sharp,  color: Colors.redAccent),
    Icon(Icons.chat, color: Colors.redAccent),
    Icon(Icons.logout, color: Colors.redAccent)
  ];
  List titls = [
    'ResetPassWord',
    'DeleteAccount',
    'Note',
    'Refferal Code',
    'messenger',
    'LogOut',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/bakugo.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'User',
                style: TextStyle(fontSize: 18, color: Colors.black,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 40,
                  thickness: 2,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Container(
                      width: 37,
                      height: 37,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: icons[index],
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        titls[index],
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 15,
                    ),
                    onTap: () {
                      if (titls[index] == 'ResetPassWord') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                        );
                      }
                      if (titls[index] == 'DeleteAccount') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => DeleteAccountPage()),
                        );
                      }
                      if (titls[index] == 'Note') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Note()),
                        );
                      }
                      if (titls[index] == 'Refferal Code') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => chuakhadung()),
                        );
                      }
                      if (titls[index] == 'messenger') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => messenger()),
                        );
                      }


                      if (titls[index] == 'LogOut') {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SplashPage()),
                        );
                      }
                    }
                  );
                },
              ),
            ],
          )),
    );
  }
}
