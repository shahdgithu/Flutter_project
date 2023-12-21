import 'package:flutter/material.dart';

class TextFieldUi extends StatelessWidget {
  TextEditingController controllerText;
  String Title;
  TextInputType type;
  int maxline;
  int valint;
  TextFieldUi(
      {super.key,
      required this.Title,
      required this.controllerText,
      this.maxline = 1,
      this.valint = 0,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 8, right: 8, left: 8),
          // height: 50,
          child: TextFormField(
            maxLines: maxline,
            obscureText: type == TextInputType.visiblePassword ? true : false,
            keyboardType: type,
            cursorColor: Colors.white,
            validator: (value) {
              if (value!.length < valint) {
                return "At least $valint letters";
              }
            },
            controller: controllerText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black)),
              labelText: Title,
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

Widget Speacer({double hi = 20}) {
  return SizedBox(
    height: hi,
  );
}
