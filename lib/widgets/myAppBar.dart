import 'package:flutter/material.dart';


class myappbar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;

  myappbar({this.title});

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override

  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$title", style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }



}