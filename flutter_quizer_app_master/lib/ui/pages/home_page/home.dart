import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quizer_app_master/block_theme/theme_bloc.dart';
import 'package:flutter_quizer_app_master/ui/pages/note/note.dart';
import 'package:flutter_quizer_app_master/ui/pages/home_page/hhome.dart';
import 'package:flutter_quizer_app_master/ui/pages/login_page/login_page.dart';
import 'package:flutter_quizer_app_master/ui/pages/setting/settings.dart';
import 'package:flutter_quizer_app_master/ui/widgets/Textbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/category.dart';
import '../../widgets/quiz_options.dart';
import 'dart:ui';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  int index =0;
  List<Widget> pages = [
    HhomePage(),
    Notes(),
    Settings(),
  ];

  int _currentIndex = 0;

  bool themeState = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Quizer',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),


        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(child: Image.asset("assets/images/logo.png")),
              Speacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    themeState ? "Dark mode" : "light mode",
                    style: TextStyle(fontSize: 25),
                  ),
                  Switch(
                    value: themeState,
                    onChanged: (value) {
                      setState(() {
                        themeState = value;
                      });
                      BlocProvider.of<ThemeBloc>(context).add(ChangeTheme());
                    },
                  ),
                ],
              ),
              Speacer(hi: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool("islogin", false);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false);
                      },
                      icon: Icon(
                        Icons.login_outlined,
                        color: Colors.green,
                      )),
                ],
              )
            ],
          ),
        ),
      body: pages[_currentIndex],

         bottomNavigationBar: BottomNavigationBar(
     currentIndex: _currentIndex,
         onTap: (index) {
     setState(() {
     _currentIndex = index;
    });
     },
     items: [
     BottomNavigationBarItem(
    icon: Icon(Icons.home),
     label: 'Home',
    ),
     BottomNavigationBarItem(
    icon: Icon(Icons.chat),
     label: 'Profile',
     ),
    BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'Settings',
     ),
     ],
    ),
    );

  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return MaterialButton(
      elevation: 0.0,
      highlightElevation: 1.0,
      onPressed: () => _categoryPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  _categoryPressed(BuildContext context, Category category) {
    showDialog(
      context: context,
      builder: (sheetContext) => Dialog(
        child: QuizOptionsDialog(
          category: category,
        ),
      ),
    );
  }

}
