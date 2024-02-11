
import 'package:firebase_auth_methods/screen_dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDlnNmA1eOTssQ9ZigvGYw59ln7ZJmrwXQ",
      authDomain: "",
      projectId: "ramadanapp-2457e",
      storageBucket: "",
      messagingSenderId: "450704756196",
      appId: "1:450704756196:android:17f11426d5b5d4d580cbf1",
    ),
  ); // Initialize Firebase

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScreenDashboard(),
    );
  }
}

