import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_signin/model/modeltest.dart';
import 'package:firebase_signin/model/ticket_master_class.dart';
import 'package:firebase_signin/screens/apiTest.dart';
import 'package:firebase_signin/screens/concerts.dart';
import 'package:firebase_signin/screens/home_screen.dart';
import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/material.dart';

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
      home: concerts(),
    );
  }
}
