import 'dart:convert';

import 'package:firebase_signin/NetWork/placeholder.dart';
import 'package:firebase_signin/model/ticket_master_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkService {
  static Future<Response> getApi() {
    final url = Uri.parse(
        "https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId=220&apikey=KcilUFXIFSv7SFGyXI8qgGsxSSvHHMAz");
    return get(url);
  }
}

class NetworkAdapter {
  Future<MyPlaceHolder> getPlaceHolder() async {
    final response = await NetworkService.getApi();
    print("success");
    final placeholder = MyPlaceHolder.fromJson(jsonDecode(response.body));
    return placeholder;
  }
}
