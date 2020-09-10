import 'package:flutter/material.dart';

DecorationImage backgroundImage() {
  return DecorationImage(
    image: AssetImage('images/woman-standing.jpg'),
    fit: BoxFit.cover,
  );
}

Text buildText(double fontSize, String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Lalezar',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}

SizedBox dividerLine() {
  return SizedBox(
    width: 100,
    child: Divider(
      thickness: 5,
      color: Colors.white,
    ),
  );
}

SizedBox addHeightSizedBox(double height) {
  return SizedBox(height: height);
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Facebook button pressed"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
