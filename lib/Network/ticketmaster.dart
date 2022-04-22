import 'dart:convert';
import 'package:firebase_signin/Network/ticketmasterFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkService {
  static Future<Response> getApi() {
    final url = Uri.parse(
        "https://app.ticketmaster.com/discovery/v2/events.json?apikey=KcilUFXIFSv7SFGyXI8qgGsxSSvHHMAz");
    return get(url);
  }
}

class NetworkAdapter {
  Future<MyTicketMasterAPI> getPlaceHolder() async {
    final response = await NetworkService.getApi();
    print("sucess");
    final ticketMasterHolder = MyTicketMasterAPI(jsonDecode(response.body));
    return ticketMasterHolder;
  }
}
