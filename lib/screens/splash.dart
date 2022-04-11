import 'package:flutter/material.dart';

class FSplash extends StatelessWidget {
  const FSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Splash Screen',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
