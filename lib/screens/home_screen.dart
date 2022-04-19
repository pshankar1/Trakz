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
      backgroundColor: Color.fromARGB(111, 66, 95, 66),
      appBar: AppBar(
        title: Text("app"),
        backgroundColor: Colors.black,
      ),
      // ignore: prefer_const_constructors
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
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
      body: SafeArea(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          color: Color.fromARGB(113, 102, 86, 1),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlutterLogo(size: 48),
                SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title of the Card',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text('Some description',
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
