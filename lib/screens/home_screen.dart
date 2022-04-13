import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:spotify_sdk/spotify_sdk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("app")),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          // color: const Color.fromARGB(255, 90, 105, 91),
          child: const Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              if (kDebugMode) {
                print("Signed Out");
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            });
          },
        ),
      ),
      body: Center(),
    );
  }
}
