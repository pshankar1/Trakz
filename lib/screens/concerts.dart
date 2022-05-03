import 'dart:io';
import 'dart:math';

import 'package:firebase_signin/NetWork/network_enum.dart';
import 'package:firebase_signin/NetWork/network_helper.dart';
import 'package:firebase_signin/model/static_values.dart';
import 'package:firebase_signin/screens/apiTest.dart';
import 'package:firebase_signin/widgets/product_tile.dart';
import 'package:flutter/material.dart';

import '../NetWork/query_param.dart';
import '../model/modeltest.dart';
import '../NetWork/network_service.dart';

class concerts extends StatefulWidget {
  const concerts({Key? key}) : super(key: key);

  @override
  State<concerts> createState() => _concertsState();
}

class _concertsState extends State<concerts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final List<Event> event = snapshot.data as List<Event>;
            return ListView.builder(
              itemBuilder: (context, index) {
                return apiTest(event[index]);
              },
              itemCount: event.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 25,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please why wont you")
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<List<Event>?> getData() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get,
        url: StaticValues.apiUrl,
        queryParam: QP.apiQP(
            apiUrl: StaticValues.apiUrl,
            apiPackage: StaticValues.apiPackage,
            apiVersion: StaticValues.apiVersion,
            apiResource: StaticValues.apiResource,
            apiKey: StaticValues.apiKey));
    // ignore: avoid_print
    print(response?.statusCode);
    // ignore: avoid_print
    print("success");
    return NetworkHelper.filterResponse(
        callBack: _listOfEventsFromJson,
        response: response,
        parameterName: CallBackParameterName.events,
        onFailureCallBackWithMesasge: (errorType, msg) {
          print('Error type- $errorType - Message $msg');
          return null;
        });
  }

  List<Event> _listOfEventsFromJson(json) => (json as List)
      .map((e) => Event.fromJson(e as Map<String, dynamic>))
      .toList();
}
