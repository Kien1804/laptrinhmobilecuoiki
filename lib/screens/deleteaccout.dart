import 'package:dangkidangnhap/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dangkidangnhap/screens/loginpage.dart';

class DeleteAccountPage extends StatefulWidget {
  @override
  _DeleteAccountPageState createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isDeletingAccount = false;
  late TextEditingController _passwordController;
  int _incorrectAttempts = 0;
  static const int _maxAttempts = 4;

  @override
  void initState(){
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _deleteAccount() async {
    setState(() {
      _isDeletingAccount = true;
    });

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String? email = user.email;
        if (email != null) {
          AuthCredential credential = EmailAuthProvider.credential(
            email: email,
            password: _passwordController.text,
          );
          await user.reauthenticateWithCredential(credential);

          await user.delete();
          await _auth.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => loginpage()),
          );
        }
      } else{
      }

    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lỗi'),
            content: Text('404-error: $error' ),
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
      _incorrectAttempts++;
    });

    if (_incorrectAttempts >= _maxAttempts) {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginpage()),
      );
    }

    setState(() {
      _isDeletingAccount = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xóa Tài Khoản'),
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
            Text(
              'Nhập mật khẩu để xác nhận xóa tài khoản:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isDeletingAccount ? null : _deleteAccount,
              child: _isDeletingAccount
                  ? CircularProgressIndicator()
                  : Text('Xóa Tài Khoản'),
            ),
          ],
        ),
      ),
    );
  }
}
