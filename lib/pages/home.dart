import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;

  buildAuthScfreen() {
    return Text('Authenticated');
  }

  buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ]),
        ),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'SocialMax',
                style: TextStyle(
                    fontFamily: "Signatra",
                    fontSize: 90.0,
                    color: Colors.white),
              ),
              GestureDetector(
                onTap: () => print('taped'),
                child: Container(
                  width: 260.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/google_signin_button.png'),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScfreen() : buildUnAuthScreen();
  }
}
