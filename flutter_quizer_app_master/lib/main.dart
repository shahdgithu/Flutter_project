import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quizer_app_master/block_theme/theme_bloc.dart';
import 'package:flutter_quizer_app_master/block_theme/themes.dart';
import 'package:flutter_quizer_app_master/ui/pages/splach.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Database/database_helper.dart';

final dbHelper = DatabaseHelper();
bool islogin = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool("islogin") != null) {
    islogin = prefs.getBool("islogin")!;
  }

  await dbHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.isDarkTheme ? darkTheme : lightTheme,
            home: const splash(),
          );
        },
      ),
    );
  }
}
