import 'package:flutter_quizer_app_master/Database/database_helper.dart';
import '../main.dart';

insertuser(String Email_, String pass_) async {
  // row to insert
  Map<String, dynamic> row = {
    DatabaseHelper.columnEmail: Email_,
    DatabaseHelper.columnPass: pass_
  };
  final id = await dbHelper.insert(row);
  print('inserted row id: $id');
}

insertresult(int corr, int incorr) async {
  // row to insert
  Map<String, dynamic> row = {
    DatabaseHelper.columnEmail: corr,
    DatabaseHelper.columnPass: incorr
  };
  final id = await dbHelper.insert(row);
  print('inserted row id: $id');
}
