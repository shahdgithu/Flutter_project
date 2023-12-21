import 'package:flutter/material.dart';
import 'package:flutter_quizer_app_master/ui/pages/login_page/login_page.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  List<String> _titles = [
    '',
    '',
    '',
  ];
  List<String> _descriptions = [
    '"Have fun and gain knowledge at the same time! Explore a wide range of questions in various fields."',
    'Make your time fun and useful with our wonderful application. Test your intelligence and challenge your friends.',
    '"Have fun and gain knowledge at the same time. Test your knowledge and find out how smart you are."',
  ];

  Stack buildImage({required String pathImage})
  {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage(pathImage),
        )
      ],
    );

  }

  List<Stack> _image =[
    img(name: 'assets/images/page1.jpg'),
    img(name:'assets/images/page2.jpg'),
    img(name: 'assets/images/page3.jpg'),

  ];


  void _nextScreen() {
    if (_currentIndex < _titles.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image[_currentIndex],
          Text(
            _titles[_currentIndex] ,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),

          Text(
            _descriptions[_currentIndex],
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _titles.length; i++)
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(

                    shape: BoxShape.circle,
                    color: _currentIndex == i ? Colors.green : Colors.grey,
                  ),
                ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text(
              _currentIndex < _titles.length - 1 ? 'Next' : 'Next',
            ),
            onPressed: _nextScreen,
          ),
        ],
      ),
    );
  }
}
Stack img ({required String name} ) {
  return    Stack(
    alignment: Alignment.center,
    children: [
      Image(
        image: AssetImage(name),
      )
    ],
  );
}
