
import 'package:firebase_auth_methods/auth_screens/sign_in_phone.dart';
import 'package:firebase_auth_methods/widgets/myAppBar.dart';
import 'package:flutter/material.dart';
import 'auth_screens/auth_with_email_password/auth_email_password_dashboard.dart';
import 'auth_screens/sign_in_anonymously.dart';
import 'auth_screens/sign_in_google.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(
        title: "Firebase Auth Methods",
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=> SignInAnonymously()));

                  },
                  child: Text("Sign in Anonymously Dashboard")),

              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=> UserAuthWithEmailAndPassword()));
                  },
                  child: Text("Signin with Email and Password Dashboard")),


              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=> SignInWithPhone()));

                  },
                  child: Text("Signin with Phone number Dashboard")),


              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=> SignInWithGoogle()));
                  },
                  child: Text("Signin with Google Dashboard")),

            ],
          ),
        ),

      ),
    );
  }
}
