import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Foods'),
        // automaticallyImplyLeading: false,
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
                onTap: () {
                  _showItemDetails(context, data);
                },
                trailing: PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                  onSelected: (String value) {
                    if (value == 'delete') {
                      _deleteItem(context, document.id);
                    }
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _showItemDetails(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(data['label']),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Total Time: ${data['totalTime']} min',
                style: TextStyle(
                  color: Colors.green,
                ),
                ),

                Text('Total Nutrients: ${data['totalNutrients']}',
                style: TextStyle(
                  color: Colors.blue,
                ),
                ),

                Text('Ingredients: ${data['ingredients']}',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(BuildContext context, String documentId) {
    FirebaseFirestore.instance.collection('favorites').doc(documentId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item deleted'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
