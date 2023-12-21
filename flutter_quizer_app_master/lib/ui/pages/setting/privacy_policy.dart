import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_quizer_app_master/ui/pages/home_page/home.dart';


class Privacy extends StatefulWidget {
  @override
  State<Privacy> createState() => _PrivacyState();
}



class _PrivacyState extends State<Privacy> {


  bool themeState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     appBar: AppBar(
       backgroundColor: Colors.white,
     leading: IconButton(
     icon: Icon(Icons.arrow_back),
     onPressed: () {
       Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) =>  HomePage()));
    },
    ),
     ),

      body: Center(
        child: Container(
          child:  Text(
            "We recognize the importance of privacy in the Tests application and are committed to protecting your personal information.  Here is some information about the privacy policy in the Tests application:"

              "1. Collection of Information: We may collect some of the personal information you provide when you use the App to create your account, such as name and email address.  We may also collect non-personal information such as the responses and scores you obtain on quizzes."

          "2. Use of Information: We use the information we collect to provide the services and functions required in the application, such as creating and administering tests and providing reports and statistics.  We may also use the information to improve your experience on the app and personalize content and advertising."

          "3. Information Sharing: We respect your privacy and do not sell or share your personal information with third parties without your explicit consent, except in cases where it is necessary to provide requested services or comply with applicable laws and regulations."

        " 4. Security: We take security measures to protect your personal information from unauthorized access, use, alteration or disclosure.  We use encryption and other security technologies to ensure the safety of your data."

          "5. Cookies: We may use cookies to improve your experience on the App, personalize content, and analyze the use of the App.  You can modify your browser's link cookie settings."

        " We advise you to read the full Privacy Policy for Testing App for more details on how we collect, use and protect your personal information.",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w100),
          ),

        ),
      ),
    );

  }

}