import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/widget.dart';
//import 'package:spotify_sdk/spotify_sdk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void onSearch() async {
  await FirebaseAuth.instance.fetchSignInMethodsForEmail("identifiers");
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
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: Color.fromARGB(255, 168, 163, 120),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 36),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(0, 228, 171, 86),
                            Color.fromARGB(255, 58, 52, 2)
                          ]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlutterLogo(size: 48),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text('Title of the Card',
                                      style:
                                          Theme.of(context).textTheme.headline5
                                      //.copyWith(color: Colors.white),
                                      ),
                                  ElevatedButton(
                                      child: Text('hey'),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                        //  .copyWith(color: Colors.white)),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 6,
                      bottom: 5,
                      child: ElevatedButton(
                          child: Text('hey'),
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            //  .copyWith(color: Colors.white)),
                          )),
                    ),
                  ],
                ),
              );
            }),
      ),
      //RowDemo(),
    );
  }
}
