import 'package:dangkidangnhap/screens/profile.dart';
import 'package:flutter/material.dart';

class messenger extends StatelessWidget {
  const messenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messenger'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Profil())
            );
          },
        ),
      ),
      body: Center(
        child: Text(
          'Thank you for choosing our service',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
