import 'package:dangkidangnhap/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';
  bool _isResettingPassword = false;

  Future<void> _resetPassword() async {
    setState(() {
      _isResettingPassword = true;
    });

    try {
      await _auth.sendPasswordResetEmail(email: _email);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sent <3'),
            content: Text('Yêu cầu đã được gửi đi rồi đó <3'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('lỗi rùi'),
            content: Text('Ko thể gửi yêu cầu đi: $e'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    setState(() {
      _isResettingPassword = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement
              (context,
                MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isResettingPassword ? null : _resetPassword,
              child: _isResettingPassword
                  ? CircularProgressIndicator()
                  : Text('Reset Password'),
            ),
            // ElevatedButton(onPressed:
            // onPressed, )
          ],
        ),
      ),
    );
  }
}
