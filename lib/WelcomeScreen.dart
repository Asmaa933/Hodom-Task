import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: backgroundImage()),
          child: Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.4),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addHeightSizedBox(200),
                  welcomeText(),
                  dividerLine(),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('تسجيل الدخول كمتسوق'),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

DecorationImage backgroundImage() {
  return DecorationImage(
    image: AssetImage('images/woman-standing.jpg'),
    fit: BoxFit.cover,
  );
}

Text welcomeText() {
  return Text(
    'اهلاً بك في هدوم',
    style: TextStyle(
      fontFamily: 'Lalezar',
      fontSize: 45,
      color: Colors.white,
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
