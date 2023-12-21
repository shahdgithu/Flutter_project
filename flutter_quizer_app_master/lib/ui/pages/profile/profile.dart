import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';


class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {


  bool themeState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: Container(
          child:  Text(
            "Profile",
            style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),

        ),
      ),
    );

  }

}