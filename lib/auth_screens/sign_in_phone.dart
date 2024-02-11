import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_methods/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({Key? key});

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  TextEditingController controller_phone = TextEditingController();
  TextEditingController controller_code = TextEditingController();
  String? verificationId;
  String? authError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(title:'Sign in with Phone'),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller_phone,
              decoration: InputDecoration(
                hintText: "Enter Phone number (+92.. Format)",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: controller_code,
              decoration: InputDecoration(
                hintText: "Authentication Code",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                prefixIcon: Icon(Icons.lock),

              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                String phone = controller_phone.text;

                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phone,
                  verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
                    print(phoneAuthCredential.toString());
                  },
                  verificationFailed: (FirebaseAuthException error) {
                    setState(() {
                      authError = error.message;
                    });
                    print("Verification failed: ${error.message}");
                  },
                  codeSent: (String verificationId, int? forceResendingToken) {
                    setState(() {
                      this.verificationId = verificationId;
                    });
                    print("Code sent");
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {
                    setState(() {
                      this.verificationId = verificationId;
                    });
                    print("Time out");
                  },
                );
              },
              child: Text("Login"),
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Verification ID: ${verificationId ?? 'Not Sent'}"),
                Text("${verificationId!= null ? "No Error":"Error: ${authError}"}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
