import 'package:dangkidangnhap/screens/profile.dart';
import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
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
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Phần mềm này được tạo ra bởi Đinh Thái Phúc - 21011622\n'
                    'và Lê Trung Kiên - 21012505, trường đại học Phenikaa,\n'
                    'với sự trợ giúp của chatGPT, youtube, flutter.dev và giảng viên Trần Đức Minh.\n'
                    'Cũng như không thể thiếu phần mềm Android Studio và các công cụ hỗ trợ khác.\n'
                    'Dự án đã hoàn thiện trong vòng hơn 1 tháng!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
