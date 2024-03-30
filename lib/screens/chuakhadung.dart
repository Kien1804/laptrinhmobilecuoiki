import 'package:dangkidangnhap/screens/profile.dart';
import 'package:flutter/material.dart';

class chuakhadung extends StatelessWidget {
  const chuakhadung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đang nâng cấp'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Profil())
            );
          },
        )
      ),
      body: Center(
        child: Text(
          'Đang nâng cấp',
          style: TextStyle(fontSize: 20),
        ),
      )
    );
  }
}
