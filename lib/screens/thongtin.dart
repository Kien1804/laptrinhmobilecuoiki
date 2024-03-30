import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dangkidangnhap/screens/detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thong tin'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('favorites').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['label']),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data['image']),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}