import 'package:dangkidangnhap/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginpage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 120),
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily:  'ro',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Email',
                      hintStyle: TextStyle(fontFamily: 'ro'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'password',
                      hintStyle: TextStyle(fontFamily: 'ro'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth
                        .instance
                        .signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    User? user = userCredential.user;
                    print('Sign in: ${user!.uid}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home())
                    );
                  }catch (e){
                    print('404-error: $e');

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Failed to sign in: $e'),
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
                },
                child: const Text('Log In'),
              ),
              const SizedBox(width: 10),

              SizedBox(height: 230),
              GestureDetector(
                  child:Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(1,1),
                          blurRadius: 10,
                        )
                      ] ,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                        topRight: Radius.circular(120),
                      ),
                    ),
                
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily:  'ro',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.77,
                          builder: (context, scrollController) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(120),
                                  topRight: Radius.circular(120),
                                ),
                              ),
                
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 50),
                                  Text('Sign Up',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily:  'ro',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                
                                      child: TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.email),
                                          hintText: 'Email',
                                          hintStyle: TextStyle(fontFamily: 'ro'),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: TextField(
                                        controller: passwordController,
                                        obscureText: true,
                                        obscuringCharacter: '*',
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.lock),
                                          hintText: 'password',
                                          hintStyle: TextStyle(fontFamily: 'ro'),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),

                                  ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        UserCredential userCredential = await FirebaseAuth
                                            .instance
                                            .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (
                                                    context) => const Home())
                                        );
                                      }catch(e){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content: Text('Failed to sign up: $e'),
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
                                    },
                                    child: const Text('Sign up'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}