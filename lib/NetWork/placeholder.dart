import '../model/ticket_master_class.dart';

class MyPlaceHolder {
  Map<String, dynamic>? placeHolders;
  MyPlaceHolder(this.placeHolders);

  factory MyPlaceHolder.fromJson(List<dynamic> json) {
    Map<String, dynamic> list =
        json.map((e) => MyPlaceHolder.fromJson(e)) as Map<String, dynamic>;

    return MyPlaceHolder(list);
  }
}

class Event {
  String? name;
  EventType? type;
  String? id;
  bool? test;
  String? url;
  Locale? locale;
  List<Image>? images;
  Sales? sales;
  Dates? dates;
  List<Classification>? classifications;
  List<Outlet>? outlets;
  Seatmap? seatmap;
  EventLinks? links;
  EventEmbedded? embedded;
  Promoter? promoter;
  List<Promoter>? promoters;
  String? info;
  String? pleaseNote;
  List<PriceRange>? priceRanges;
  List<Product>? products;
  Accessibility? accessibility;
  TicketLimit? ticketLimit;
  AgeRestrictions? ageRestrictions;
  String? code;
  Ticketing? ticketing;

  Event(
      {this.name,
      this.type,
      this.id,
      this.test,
      this.url,
      this.locale,
      this.images,
      this.sales,
      this.dates,
      this.classifications,
      this.outlets,
      this.seatmap,
      this.links,
      this.embedded,
      this.promoters,
      this.promoter,
      this.info,
      this.pleaseNote,
      this.priceRanges,
      this.products,
      this.accessibility,
      this.ticketLimit,
      this.ageRestrictions,
      this.code,
      this.ticketing});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json["name"],
      type: eventTypeValues.map[json["type"]],
      id: json["id"],
      test: json["test"],
      url: json["url"],
      locale: localeValues.map[json["locale"]],
      images: List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      sales: Sales.fromJson(json["sales"]),
      dates: Dates.fromJson(json["dates"]),
      classifications: List<Classification>.from(
          json["classifications"]!.map((x) => Classification.fromJson(x))),
      outlets: json["outlets"] == null
          ? null
          : List<Outlet>.from(json["outlets"]!.map((x) => Outlet.fromJson(x))),
      seatmap: Seatmap.fromJson(json["seatmap"]),
      links: EventLinks.fromJson(json["_links"]),
      embedded: EventEmbedded.fromJson(json["_embedded"]),
      promoter:
          json["promoter"] == null ? null : Promoter.fromJson(json["promoter"]),
      promoters: json["promoters"] == null
          ? null
          : List<Promoter>.from(
              json["promoters"]!.map((x) => Promoter.fromJson(x))),
      info: json["info"] == null ? null : json["info"],
      pleaseNote: json["pleaseNote"] == null ? null : json["pleaseNote"],
      priceRanges: json["priceRanges"] == null
          ? null
          : List<PriceRange>.from(
              json["priceRanges"]!.map((x) => PriceRange.fromJson(x))),
      products: json["products"] == null
          ? null
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
      accessibility: json["accessibility"] == null
          ? null
          : Accessibility.fromJson(json["accessibility"]),
      ticketLimit: json["ticketLimit"] == null
          ? null
          : TicketLimit.fromJson(json["ticketLimit"]),
      ageRestrictions: json["ageRestrictions"] == null
          ? null
          : AgeRestrictions.fromJson(json["ageRestrictions"]),
      code: json["code"] == null ? null : json["code"],
      ticketing: json["ticketing"] == null
          ? null
          : Ticketing.fromJson(json["ticketing"]),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["name"] = name;
    json["type"] = eventTypeValues.reverse![type];
    json["id"] = id;
    json["test"] = test;
    json["url"] = url;
    json["locale"] = localeValues.reverse![locale];
    json["images"] = List<dynamic>.from(images!.map((x) => x.toJson()));
    json["sales"] = sales?.toJson();
    json["dates"] = dates?.toJson();
    json["classifications"] =
        List<dynamic>.from(classifications!.map((x) => x.toJson()));
    json["outlets"] = outlets == null
        ? null
        : List<dynamic>.from(outlets!.map((x) => x.toJson()));
    json["seatmap"] = seatmap?.toJson();
    json["_links"] = links?.toJson();
    json["_embedded"] = embedded?.toJson();
    json["promoter"] = promoter == null ? null : promoter?.toJson();
    json["promoters"] = promoters == null
        ? null
        : List<dynamic>.from(promoters!.map((x) => x.toJson()));
    json["info"] = info == null ? null : info;
    json["pleaseNote"] = pleaseNote == null ? null : pleaseNote;
    json["priceRanges"] = priceRanges == null
        ? null
        : List<dynamic>.from(priceRanges!.map((x) => x.toJson()));
    json["products"] = products == null
        ? null
        : List<dynamic>.from(products!.map((x) => x.toJson()));
    json["accessibility"] =
        accessibility == null ? null : accessibility?.toJson();
    json["ticketLimit"] = ticketLimit == null ? null : ticketLimit?.toJson();
    json["ageRestrictions"] =
        ageRestrictions == null ? null : ageRestrictions?.toJson();
    json["code"] = code == null ? null : code;
    json["ticketing"] = ticketing == null ? null : ticketing?.toJson();
    return json;
  }

  // static Event fromJson(json) =>
  // Event(images: json['images'], name: json['name'], url: json['url']);
}
