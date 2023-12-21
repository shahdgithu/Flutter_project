import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_quizer_app_master/ui/pages/setting/privacy_policy.dart';


class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}



class _SettingsState extends State<Settings> {


  bool themeState = false;

  @override
  Widget build(BuildContext context) {
  return Center(

    // child: Column(
    //
    // mainAxisAlignment: MainAxisAlignment.center,
    // children: <Widget>[
    //   SizedBox(height: 16),
    // MaterialButton(
    // elevation: 4,
    // highlightElevation: 1.0,
    // color: Colors.green.withOpacity(0.3),
    // onPressed: () { Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => Privacy()),
    // );},
    // child: Text(
    // "Who are we?",
    // textAlign: TextAlign.center,
    // maxLines: 3,
    // style: TextStyle(fontSize: 16),
    // ),
    // ),
    // SizedBox(width: 16), // المسافة بين الأزرار
    // MaterialButton(
    // elevation: 4,
    // highlightElevation: 1.0,
    // color: Colors.green.withOpacity(0.3),
    // onPressed: () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => Privacy()));
    // },
    // child: Text(
    // "What do we do?",
    // textAlign: TextAlign.center,
    // maxLines: 3,
    // style: TextStyle(fontSize: 16),
    // ),
    // ),
    // SizedBox(width: 16), // المسافة بين الأزرار
    // MaterialButton(
    // elevation: 4,
    // highlightElevation: 1.0,
    // color: Colors.green.withOpacity(0.3),
    // onPressed: () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => Privacy()));
    // },
    // child: Text(
    // "Contact us",
    // textAlign: TextAlign.center,
    // maxLines: 3,
    // style: TextStyle(fontSize: 16),
    // ),
    // ),
    // ],
    // ),
  );
  }


}