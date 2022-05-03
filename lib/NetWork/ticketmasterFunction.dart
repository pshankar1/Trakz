class MyTicketMasterAPI {
  Map<String, dynamic>? ticketMasterHolder;
  MyTicketMasterAPI(this.ticketMasterHolder);

  factory MyTicketMasterAPI.fromJson(List<dynamic> json) {
    Map<String, dynamic> list =
        json.map((e) => MyTicketMasterAPI.fromJson(e)) as Map<String, dynamic>;

    return MyTicketMasterAPI(list);
  }
}

class State {
  String? name;
  String? stateCode;

  State({this.name, this.stateCode});

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      name: json["name"],
      stateCode: json["stateCode"],
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "stateCode": stateCode,
      };
}
