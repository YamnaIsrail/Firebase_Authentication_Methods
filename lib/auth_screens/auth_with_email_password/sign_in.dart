import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController controller_email= TextEditingController();
  TextEditingController controller_password= TextEditingController();
  var auth_value;
  var auth_error;
  String userImage="data:image/png;base64,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";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xff8168c9),
                  child: CircleAvatar(
                    radius: 47,
                    backgroundColor: Color(0xff6c33b0),
                    backgroundImage: NetworkImage(userImage),
                  ),
                ),


                SizedBox(height: 30,),

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

                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password)
                          .then((value) {
                            setState(() {
                              auth_value= value;
                            });
                        print("signInWithEmailAndPassword #01 : User  ${value.user.toString()}");
                        print("signInWithEmailAndPassword #02: additionalUserInfo  ${value.additionalUserInfo.toString()}");
                        print("signInWithEmailAndPassword #03 :credential ${value.credential.toString()}");
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
                    Text(auth_value!= null?"No Error! User Signed In":"Error: $auth_error"),
                  ],
                )

              ],
            ),
          ),
        )
    );
  }
}
