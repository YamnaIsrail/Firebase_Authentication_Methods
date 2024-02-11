import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_methods/widgets/myAppBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignInAnonymously extends StatefulWidget {
  const SignInAnonymously({super.key});

  @override
  State<SignInAnonymously> createState() => _SignInAnonymouslyState();
}

class _SignInAnonymouslyState extends State<SignInAnonymously> {
  TextEditingController controller_email= TextEditingController();
  TextEditingController controller_password= TextEditingController();
  var anonymous_value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(title: 'Sign In Anonymously',),
        body: Container(
          padding: EdgeInsets.all(40.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller_email,
                decoration: InputDecoration(
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),

              SizedBox(height: 30,),

              TextField(
                controller: controller_password,
                decoration: InputDecoration(
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                    borderSide: BorderSide.none, // No border side
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Padding around the content
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {

                    },
                  ),
                ),
              ),

              SizedBox(height: 30,),

              ElevatedButton(
                  onPressed: () async {
                    String email = controller_email.text;
                    String password = controller_password.text;

                    FirebaseAuth.instance.signInAnonymously()
                        .then((value) {
                          setState(() {
                            anonymous_value= value;
                          });
                      print("signInAnonymously #01 : User  ${value.user.toString()}");
                      print("signInAnonymously #02: additionalUserInfo  ${value.additionalUserInfo.toString()}");
                      print("signInAnonymously #03 :credential ${value.credential.toString()}");
                    }).catchError((error) {
                      print("Error creating user: $error");
                    });
                  },

                  child:
                  Text(" Login ")
              ),

              SizedBox(height: 30,),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("User ID: ${anonymous_value?.user?.uid ?? 'Unknown'}"),
                  Text("New User: ${anonymous_value?.additionalUserInfo?.isNewUser ?? 'Unknown'}"),

                ],
              ),


          //Text(anonymous_value!= null ?"signInAnonymously #01 : User  ${anonymous_value.user.toString()}" : "")



          ],
          ),
        )
    );
  }
}
