import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_signin/screens/concerts.dart';
import 'package:firebase_signin/screens/home_screen.dart';
import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'Network/ticketmaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const concerts(),
    );
  }
}

class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  @override
  void initState() {
    NetworkAdapter().getPlaceHolder().then((value) {
      print("RESPONSE => ${value.ticketMasterHolder}");
    }, onError: (error) {
      print(error);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
