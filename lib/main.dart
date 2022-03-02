import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'login/newUser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    AssetImage icon = AssetImage('images/trakz.png');
    AssetImage spotify = AssetImage('images/spotify.png');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 40, 54),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Image(image: icon),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),

            Container(
              width: 400,
              height: 80,
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 88, 143, 90),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'wussyaname'),
              ),
            ),

            Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(71, 19, 220, 109),
                  border: Border(
                    bottom: BorderSide(color: Color(0x13DC6F)),
                  )),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Color.fromARGB(255, 88, 143, 90),
                    labelText: 'Password',
                    hintText: 'shhh we won\'t tell'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Registration Button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'New Here? Come Sign Up!',
                style: TextStyle(
                    color: Color.fromARGB(255, 19, 220, 111),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Login Button Below
            Container(
              //Login Button
              height: 80,
              width: 270,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 120, 120, 154), width: 5.0),
                  borderRadius: BorderRadius.circular(40)),
              child: OutlineButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 28),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //Login Button
            Container(
              height: 80,
              width: 270,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 19, 220, 111), width: 5.0),
                  borderRadius: BorderRadius.circular(40)),
              child: OutlineButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child:
                    new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  const Text(
                    "Continue With",
                    style: TextStyle(
                        color: Color.fromARGB(255, 19, 220, 111),
                        fontWeight: FontWeight.w500),
                    textScaleFactor: 1.9,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Image(
                        image: spotify,
                        height: 55,
                        width: 55,
                      ))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
