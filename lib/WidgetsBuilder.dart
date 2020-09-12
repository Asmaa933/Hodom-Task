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

showAlertDialog(BuildContext context, String title, String message) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(
      "ok",
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title, textAlign: TextAlign.center),
    content: Text(message, textAlign: TextAlign.center),
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

BoxShadow makeBoxShadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 3,
    blurRadius: 7,
    offset: Offset(0, 3),
  );
}
