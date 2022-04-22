import 'package:flutter/cupertino.dart';

import '../Network/ticketmaster.dart';

class concerts extends StatefulWidget {
  const concerts({Key? key}) : super(key: key);

  @override
  State<concerts> createState() => _concertsState();
}

class _concertsState extends State<concerts> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void initState() {
    NetworkAdapter().getPlaceHolder().then((value) {
      print("RESPONSE => ${value.ticketMasterHolder.toString()}");
    }, onError: (error) {
      print(error);
    });
    super.initState();
  }
}
