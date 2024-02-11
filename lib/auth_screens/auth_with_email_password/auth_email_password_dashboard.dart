
import 'package:firebase_auth_methods/auth_screens/auth_with_email_password/create_user.dart';
import 'package:firebase_auth_methods/auth_screens/auth_with_email_password/sign_in.dart';
import 'package:flutter/material.dart';

class UserAuthWithEmailAndPassword extends StatefulWidget {
  const UserAuthWithEmailAndPassword({super.key});

  @override
  State<UserAuthWithEmailAndPassword> createState() => _UserAuthWithEmailAndPasswordState();
}

class _UserAuthWithEmailAndPasswordState extends State<UserAuthWithEmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('User Auth with Email and Password',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Create New User'),
                Tab(text: 'Login',),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,

            ),
          ),
          body: TabBarView(
            children: [
              CreateUserScreen(),
              SigninScreen(),
            ],
          ),
        ),
      ),
    );
  }
}


