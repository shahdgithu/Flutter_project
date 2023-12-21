import 'package:flutter/material.dart';
import 'package:flutter_quizer_app_master/ui/pages/onBording/on_bording.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
//navigator
  navigator() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  void initState() {
    navigator();
    // print("i am in");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/logo.png")),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  color: Colors.green,
                )),
          ],
        ),
      ),
    );
  }
}
