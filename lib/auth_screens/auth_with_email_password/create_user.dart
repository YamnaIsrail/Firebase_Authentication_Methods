import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_methods/widgets/myAppBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController controller_email= TextEditingController();
  TextEditingController controller_password= TextEditingController();
  var auth_value;
  var auth_error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          padding: EdgeInsets.all(40),
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
                  fillColor: Colors.grey[200], // Background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                    borderSide: BorderSide.none, // No border side
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Padding around the content
                  prefixIcon: Icon(Icons.lock), // Icon at the beginning of the field
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility), // Toggle visibility icon
                    onPressed: () {
                      // Add functionality to toggle visibility
                    },
                  ),
                ),
              ),

              SizedBox(height: 30,),

              ElevatedButton(
                  onPressed: () async {
                    String email = controller_email.text;
                    String password = controller_password.text;

                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: password)
                        .then((value) {
                          setState(() {
                            auth_value= value;
                          });

                      print("createUserWithEmailAndPassword #01 : User  ${value.user.toString()}");
                      print("createUserWithEmailAndPassword #02: additionalUserInfo  ${value.additionalUserInfo.toString()}");
                      print("createUserWithEmailAndPassword #03 :credential ${value.credential.toString()}");
                    }).catchError((error) {
                      setState(() {
                        auth_error= error;
                      });

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

                  Text("User ID: ${auth_value?.user?.uid ?? 'Unknown'}"),
                  Text("New User: ${auth_value?.additionalUserInfo?.isNewUser ?? 'Unknown'}"),
                  Text(auth_value!= null?"No Error! User Added":"Error: $auth_error"),
                ],
              )


            ],
          ),
        )
    );
  }
}
