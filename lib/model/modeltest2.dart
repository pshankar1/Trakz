// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.embedded,
    required this.links,
    required this.page,
  });

  WelcomeEmbedded embedded;
  WelcomeLinks links;
  Page page;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        embedded: WelcomeEmbedded.fromJson(json["_embedded"]),
        links: WelcomeLinks.fromJson(json["_links"]),
        page: Page.fromJson(json["page"]),
      );

  Map<String, dynamic> toJson() => {
        "_embedded": embedded.toJson(),
        "_links": links.toJson(),
        "page": page.toJson(),
      };
}

class WelcomeEmbedded {
  WelcomeEmbedded({
    required this.events,
  });

  List<Event> events;

  factory WelcomeEmbedded.fromJson(Map<String, dynamic> json) =>
      WelcomeEmbedded(
        events: List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    required this.url,
    required this.locale,
    required this.images,
    required this.sales,
    required this.dates,
    required this.classifications,
    required this.outlets,
    required this.seatmap,
    required this.links,
    required this.embedded,
    required this.promoter,
    required this.promoters,
    required this.info,
    required this.pleaseNote,
    required this.priceRanges,
    required this.products,
    required this.accessibility,
    required this.ticketLimit,
    required this.ageRestrictions,
    required this.code,
    required this.ticketing,
  });

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

  factory Event.fromJson(Map<String, dynamic> json) => Event(
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
            : List<Outlet>.from(
                json["outlets"]!.map((x) => Outlet.fromJson(x))),
        seatmap: Seatmap.fromJson(json["seatmap"]),
        links: EventLinks.fromJson(json["_links"]),
        embedded: EventEmbedded.fromJson(json["_embedded"]),
        promoter: json["promoter"] == null
            ? null
            : Promoter.fromJson(json["promoter"]),
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

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": eventTypeValues.reverse![type],
        "id": id,
        "test": test,
        "url": url,
        "locale": localeValues.reverse![locale],
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "sales": sales?.toJson(),
        "dates": dates?.toJson(),
        "classifications":
            List<dynamic>.from(classifications!.map((x) => x.toJson())),
        "outlets": outlets == null
            ? null
            : List<dynamic>.from(outlets!.map((x) => x.toJson())),
        "seatmap": seatmap?.toJson(),
        "_links": links?.toJson(),
        "_embedded": embedded?.toJson(),
        "promoter": promoter == null ? null : promoter?.toJson(),
        "promoters": promoters == null
            ? null
            : List<dynamic>.from(promoters!.map((x) => x.toJson())),
        "info": info == null ? null : info,
        "pleaseNote": pleaseNote == null ? null : pleaseNote,
        "priceRanges": priceRanges == null
            ? null
            : List<dynamic>.from(priceRanges!.map((x) => x.toJson())),
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "accessibility": accessibility == null ? null : accessibility?.toJson(),
        "ticketLimit": ticketLimit == null ? null : ticketLimit?.toJson(),
        "ageRestrictions":
            ageRestrictions == null ? null : ageRestrictions?.toJson(),
        "code": code == null ? null : code,
        "ticketing": ticketing == null ? null : ticketing?.toJson(),
      };

  // static Event fromJson(json) =>
  // Event(images: json['images'], name: json['name'], url: json['url']);
}

class Accessibility {
  Accessibility({
    required this.ticketLimit,
    required this.info,
    required this.url,
    required this.urlText,
  });

  int ticketLimit;
  String info;
  String url;
  String urlText;

  factory Accessibility.fromJson(Map<String, dynamic> json) => Accessibility(
        ticketLimit: json["ticketLimit"],
        info: json["info"] == null ? null : json["info"],
        url: json["url"] == null ? null : json["url"],
        urlText: json["urlText"] == null ? null : json["urlText"],
      );

  Map<String, dynamic> toJson() => {
        "ticketLimit": ticketLimit,
        "info": info == null ? null : info,
        "url": url == null ? null : url,
        "urlText": urlText == null ? null : urlText,
      };
}

class AgeRestrictions {
  AgeRestrictions({
    required this.legalAgeEnforced,
  });

  bool legalAgeEnforced;

  factory AgeRestrictions.fromJson(Map<String, dynamic> json) =>
      AgeRestrictions(
        legalAgeEnforced: json["legalAgeEnforced"],
      );

  Map<String, dynamic> toJson() => {
        "legalAgeEnforced": legalAgeEnforced,
      };
}

class Classification {
  Classification({
    required this.primary,
    required this.segment,
    required this.genre,
    required this.subGenre,
    required this.type,
    required this.subType,
    required this.family,
  });

  bool? primary;
  Genre? segment;
  Genre? genre;
  Genre? subGenre;
  Genre? type;
  Genre? subType;
  bool? family;

  factory Classification.fromJson(Map<String, dynamic> json) => Classification(
        primary: json["primary"],
        segment: Genre.fromJson(json["segment"]),
        genre: Genre.fromJson(json["genre"]),
        subGenre: Genre.fromJson(json["subGenre"]),
        type: json["type"] == null ? null : Genre.fromJson(json["type"]),
        subType:
            json["subType"] == null ? null : Genre.fromJson(json["subType"]),
        family: json["family"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "segment": segment?.toJson(),
        "genre": genre?.toJson(),
        "subGenre": subGenre?.toJson(),
        "type": type == null ? null : type?.toJson(),
        "subType": subType == null ? null : subType?.toJson(),
        "family": family,
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Dates {
  Dates({
    required this.start,
    required this.status,
    required this.spanMultipleDays,
    required this.timezone,
  });

  Start start;
  Status status;
  bool spanMultipleDays;
  Timezone? timezone;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        start: Start.fromJson(json["start"]),
        status: Status.fromJson(json["status"]),
        spanMultipleDays: json["spanMultipleDays"],
        timezone: json["timezone"] == null
            ? null
            : timezoneValues.map[json["timezone"]],
      );

  Map<String, dynamic> toJson() => {
        "start": start.toJson(),
        "status": status.toJson(),
        "spanMultipleDays": spanMultipleDays,
        "timezone": timezone == null ? null : timezoneValues.reverse![timezone],
      };
}

class Start {
  Start({
    required this.localDate,
    required this.localTime,
    required this.dateTime,
    required this.dateTbd,
    required this.dateTba,
    required this.timeTba,
    required this.noSpecificTime,
  });

  DateTime localDate;
  String? localTime;
  DateTime? dateTime;
  bool dateTbd;
  bool dateTba;
  bool timeTba;
  bool noSpecificTime;

  factory Start.fromJson(Map<String, dynamic> json) => Start(
        localDate: DateTime.parse(json["localDate"]),
        localTime: json["localTime"] == null ? null : json["localTime"],
        dateTime:
            json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        dateTbd: json["dateTBD"],
        dateTba: json["dateTBA"],
        timeTba: json["timeTBA"],
        noSpecificTime: json["noSpecificTime"],
      );

  Map<String, dynamic> toJson() => {
        "localDate":
            "${localDate.year.toString().padLeft(4, '0')}-${localDate.month.toString().padLeft(2, '0')}-${localDate.day.toString().padLeft(2, '0')}",
        "localTime": localTime == null ? null : localTime,
        "dateTime": dateTime == null ? null : dateTime?.toIso8601String(),
        "dateTBD": dateTbd,
        "dateTBA": dateTba,
        "timeTBA": timeTba,
        "noSpecificTime": noSpecificTime,
      };
}

class Status {
  Status({
    required this.code,
  });

  Code? code;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: codeValues.map[json["code"]],
      );

  Map<String, dynamic> toJson() => {
        "code": codeValues.reverse![code],
      };
}

enum Code { ONSALE, OFFSALE }

final codeValues = EnumValues({"offsale": Code.OFFSALE, "onsale": Code.ONSALE});

enum Timezone {
  AMERICA_CHICAGO,
  AMERICA_PHOENIX,
  AMERICA_NEW_YORK,
  AMERICA_LOS_ANGELES
}

final timezoneValues = EnumValues({
  "America/Chicago": Timezone.AMERICA_CHICAGO,
  "America/Los_Angeles": Timezone.AMERICA_LOS_ANGELES,
  "America/New_York": Timezone.AMERICA_NEW_YORK,
  "America/Phoenix": Timezone.AMERICA_PHOENIX
});

class EventEmbedded {
  EventEmbedded({
    required this.venues,
    required this.attractions,
  });

  List<Venue> venues;
  List<Attraction> attractions;

  factory EventEmbedded.fromJson(Map<String, dynamic> json) => EventEmbedded(
        venues: List<Venue>.from(json["venues"]!.map((x) => Venue.fromJson(x))),
        attractions: List<Attraction>.from(
            json["attractions"]!.map((x) => Attraction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "venues": List<dynamic>.from(venues.map((x) => x.toJson())),
        "attractions": List<dynamic>.from(attractions.map((x) => x.toJson())),
      };
}

class Attraction {
  Attraction({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    required this.url,
    required this.locale,
    required this.externalLinks,
    required this.images,
    required this.classifications,
    required this.upcomingEvents,
    required this.links,
    required this.aliases,
  });

  String name;
  AttractionType? type;
  String id;
  bool test;
  String url;
  Locale? locale;
  ExternalLinks externalLinks;
  List<Image> images;
  List<Classification> classifications;
  Map<String, int> upcomingEvents;
  AttractionLinks links;
  List<String>? aliases;

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
        name: json["name"],
        type: attractionTypeValues.map[json["type"]],
        id: json["id"],
        test: json["test"],
        url: json["url"],
        locale: localeValues.map[json["locale"]],
        externalLinks: ExternalLinks.fromJson(json["externalLinks"]),
        images: List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        classifications: List<Classification>.from(
            json["classifications"]!.map((x) => Classification.fromJson(x))),
        upcomingEvents: Map.from(json["upcomingEvents"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        links: AttractionLinks.fromJson(json["_links"]),
        aliases: json["aliases"] == null
            ? null
            : List<String>.from(json["aliases"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": attractionTypeValues.reverse![type],
        "id": id,
        "test": test,
        "url": url,
        "locale": localeValues.reverse![locale],
        "externalLinks": externalLinks.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "classifications":
            List<dynamic>.from(classifications.map((x) => x.toJson())),
        "upcomingEvents": Map.from(upcomingEvents)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "_links": links.toJson(),
        "aliases":
            aliases == null ? null : List<dynamic>.from(aliases!.map((x) => x)),
      };
}

class ExternalLinks {
  ExternalLinks({
    required this.twitter,
    required this.wiki,
    required this.facebook,
    required this.instagram,
    required this.homepage,
    required this.youtube,
    required this.lastfm,
    required this.musicbrainz,
    required this.itunes,
    required this.spotify,
  });

  List<Facebook> twitter;
  List<Facebook> wiki;
  List<Facebook> facebook;
  List<Facebook>? instagram;
  List<Facebook> homepage;
  List<Facebook>? youtube;
  List<Facebook>? lastfm;
  List<Musicbrainz>? musicbrainz;
  List<Facebook>? itunes;
  List<Facebook>? spotify;

  factory ExternalLinks.fromJson(Map<String, dynamic> json) => ExternalLinks(
        twitter: List<Facebook>.from(
            json["twitter"]!.map((x) => Facebook.fromJson(x))),
        wiki:
            List<Facebook>.from(json["wiki"]!.map((x) => Facebook.fromJson(x))),
        facebook: List<Facebook>.from(
            json["facebook"]!.map((x) => Facebook.fromJson(x))),
        instagram: json["instagram"] == null
            ? null
            : List<Facebook>.from(
                json["instagram"]!.map((x) => Facebook.fromJson(x))),
        homepage: List<Facebook>.from(
            json["homepage"]!.map((x) => Facebook.fromJson(x))),
        youtube: json["youtube"] == null
            ? null
            : List<Facebook>.from(
                json["youtube"]!.map((x) => Facebook.fromJson(x))),
        lastfm: json["lastfm"] == null
            ? null
            : List<Facebook>.from(
                json["lastfm"]!.map((x) => Facebook.fromJson(x))),
        musicbrainz: json["musicbrainz"] == null
            ? null
            : List<Musicbrainz>.from(
                json["musicbrainz"]!.map((x) => Musicbrainz.fromJson(x))),
        itunes: json["itunes"] == null
            ? null
            : List<Facebook>.from(
                json["itunes"]!.map((x) => Facebook.fromJson(x))),
        spotify: json["spotify"] == null
            ? null
            : List<Facebook>.from(
                json["spotify"]!.map((x) => Facebook.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "twitter": List<dynamic>.from(twitter.map((x) => x.toJson())),
        "wiki": List<dynamic>.from(wiki.map((x) => x.toJson())),
        "facebook": List<dynamic>.from(facebook.map((x) => x.toJson())),
        "instagram": instagram == null
            ? null
            : List<dynamic>.from(instagram!.map((x) => x.toJson())),
        "homepage": List<dynamic>.from(homepage.map((x) => x.toJson())),
        "youtube": youtube == null
            ? null
            : List<dynamic>.from(youtube!.map((x) => x.toJson())),
        "lastfm": lastfm == null
            ? null
            : List<dynamic>.from(lastfm!.map((x) => x.toJson())),
        "musicbrainz": musicbrainz == null
            ? null
            : List<dynamic>.from(musicbrainz!.map((x) => x.toJson())),
        "itunes": itunes == null
            ? null
            : List<dynamic>.from(itunes!.map((x) => x.toJson())),
        "spotify": spotify == null
            ? null
            : List<dynamic>.from(spotify!.map((x) => x.toJson())),
      };
}

class Facebook {
  Facebook({
    required this.url,
  });

  String url;

  factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Musicbrainz {
  Musicbrainz({
    required this.id,
  });

  String id;

  factory Musicbrainz.fromJson(Map<String, dynamic> json) => Musicbrainz(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Image {
  Image({
    required this.ratio,
    required this.url,
    required this.width,
    required this.height,
    required this.fallback,
    required this.attribution,
  });

  Ratio? ratio;
  String url;
  int width;
  int height;
  bool fallback;
  String attribution;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        ratio: json["ratio"] == null ? null : ratioValues.map[json["ratio"]],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        fallback: json["fallback"],
        attribution: json["attribution"] == null ? null : json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "ratio": ratio == null ? null : ratioValues.reverse![ratio],
        "url": url,
        "width": width,
        "height": height,
        "fallback": fallback,
        "attribution": attribution == null ? null : attribution,
      };
}

enum Ratio { THE_169, THE_32, THE_43, THE_31 }

final ratioValues = EnumValues({
  "16_9": Ratio.THE_169,
  "3_1": Ratio.THE_31,
  "3_2": Ratio.THE_32,
  "4_3": Ratio.THE_43
});

class AttractionLinks {
  AttractionLinks({
    required this.self,
  });

  First self;

  factory AttractionLinks.fromJson(Map<String, dynamic> json) =>
      AttractionLinks(
        self: First.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
      };
}

class First {
  First({
    required this.href,
  });

  String href;

  factory First.fromJson(Map<String, dynamic> json) => First(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

enum Locale { EN_US }

final localeValues = EnumValues({"en-us": Locale.EN_US});

enum AttractionType { ATTRACTION }

final attractionTypeValues =
    EnumValues({"attraction": AttractionType.ATTRACTION});

class Venue {
  Venue({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    required this.locale,
    required this.images,
    required this.postalCode,
    required this.timezone,
    required this.city,
    required this.state,
    required this.country,
    required this.address,
    required this.location,
    required this.dmas,
    required this.upcomingEvents,
    required this.links,
    required this.url,
    required this.markets,
    required this.boxOfficeInfo,
    required this.parkingDetail,
    required this.accessibleSeatingDetail,
    required this.generalInfo,
    required this.social,
    required this.ada,
    required this.aliases,
  });

  String name;
  VenueType? type;
  String id;
  bool test;
  Locale? locale;
  List<Image>? images;
  String postalCode;
  Timezone? timezone;
  City city;
  State2 state;
  Country country;
  Address address;
  Location location;
  List<Dma> dmas;
  UpcomingEvents upcomingEvents;
  AttractionLinks links;
  String? url;
  List<Genre>? markets;
  BoxOfficeInfo? boxOfficeInfo;
  String parkingDetail;
  String accessibleSeatingDetail;
  GeneralInfo? generalInfo;
  Social? social;
  Ada? ada;
  List<String>? aliases;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        name: json["name"],
        type: venueTypeValues.map[json["type"]],
        id: json["id"],
        test: json["test"],
        locale: localeValues.map[json["locale"]],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        postalCode: json["postalCode"],
        timezone: timezoneValues.map[json["timezone"]],
        city: City.fromJson(json["city"]),
        state: State2.fromJson(json["state"]),
        country: Country.fromJson(json["country"]),
        address: Address.fromJson(json["address"]),
        location: Location.fromJson(json["location"]),
        dmas: List<Dma>.from(json["dmas"]!.map((x) => Dma.fromJson(x))),
        upcomingEvents: UpcomingEvents.fromJson(json["upcomingEvents"]),
        links: AttractionLinks.fromJson(json["_links"]),
        url: json["url"] == null ? null : json["url"],
        markets: json["markets"] == null
            ? null
            : List<Genre>.from(json["markets"]!.map((x) => Genre.fromJson(x))),
        boxOfficeInfo: json["boxOfficeInfo"] == null
            ? null
            : BoxOfficeInfo.fromJson(json["boxOfficeInfo"]),
        parkingDetail:
            json["parkingDetail"] == null ? null : json["parkingDetail"],
        accessibleSeatingDetail: json["accessibleSeatingDetail"] == null
            ? null
            : json["accessibleSeatingDetail"],
        generalInfo: json["generalInfo"] == null
            ? null
            : GeneralInfo.fromJson(json["generalInfo"]),
        social: json["social"] == null ? null : Social.fromJson(json["social"]),
        ada: json["ada"] == null ? null : Ada.fromJson(json["ada"]),
        aliases: json["aliases"] == null
            ? null
            : List<String>.from(json["aliases"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": venueTypeValues.reverse![type],
        "id": id,
        "test": test,
        "locale": localeValues.reverse![locale],
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "postalCode": postalCode,
        "timezone": timezoneValues.reverse![timezone],
        "city": city.toJson(),
        "state": state.toJson(),
        "country": country.toJson(),
        "address": address.toJson(),
        "location": location.toJson(),
        "dmas": List<dynamic>.from(dmas.map((x) => x.toJson())),
        "upcomingEvents": upcomingEvents.toJson(),
        "_links": links.toJson(),
        "url": url == null ? null : url,
        "markets": markets == null
            ? null
            : List<dynamic>.from(markets!.map((x) => x.toJson())),
        "boxOfficeInfo": boxOfficeInfo == null ? null : boxOfficeInfo!.toJson(),
        "parkingDetail": parkingDetail == null ? null : parkingDetail,
        "accessibleSeatingDetail":
            accessibleSeatingDetail == null ? null : accessibleSeatingDetail,
        "generalInfo": generalInfo == null ? null : generalInfo!.toJson(),
        "social": social == null ? null : social!.toJson(),
        "ada": ada == null ? null : ada!.toJson(),
        "aliases":
            aliases == null ? null : List<dynamic>.from(aliases!.map((x) => x)),
      };
}

class Ada {
  Ada({
    required this.adaPhones,
    required this.adaCustomCopy,
    required this.adaHours,
  });

  String adaPhones;
  String adaCustomCopy;
  String adaHours;

  factory Ada.fromJson(Map<String, dynamic> json) => Ada(
        adaPhones: json["adaPhones"],
        adaCustomCopy: json["adaCustomCopy"],
        adaHours: json["adaHours"],
      );

  Map<String, dynamic> toJson() => {
        "adaPhones": adaPhones,
        "adaCustomCopy": adaCustomCopy,
        "adaHours": adaHours,
      };
}

class Address {
  Address({
    required this.line1,
  });

  String line1;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"],
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
      };
}

class BoxOfficeInfo {
  BoxOfficeInfo({
    required this.phoneNumberDetail,
    required this.openHoursDetail,
    required this.acceptedPaymentDetail,
    required this.willCallDetail,
  });

  String phoneNumberDetail;
  String openHoursDetail;
  String acceptedPaymentDetail;
  String willCallDetail;

  factory BoxOfficeInfo.fromJson(Map<String, dynamic> json) => BoxOfficeInfo(
        phoneNumberDetail: json["phoneNumberDetail"] == null
            ? null
            : json["phoneNumberDetail"],
        openHoursDetail: json["openHoursDetail"],
        acceptedPaymentDetail: json["acceptedPaymentDetail"],
        willCallDetail:
            json["willCallDetail"] == null ? null : json["willCallDetail"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumberDetail":
            phoneNumberDetail == null ? null : phoneNumberDetail,
        "openHoursDetail": openHoursDetail,
        "acceptedPaymentDetail": acceptedPaymentDetail,
        "willCallDetail": willCallDetail == null ? null : willCallDetail,
      };
}

class City {
  City({
    required this.name,
  });

  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Country {
  Country({
    required this.name,
    required this.countryCode,
  });

  Name? name;
  CountryCode? countryCode;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: nameValues.map[json["name"]],
        countryCode: countryCodeValues.map[json["countryCode"]],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse![name],
        "countryCode": countryCodeValues.reverse![countryCode],
      };
}

enum CountryCode { US }

final countryCodeValues = EnumValues({"US": CountryCode.US});

enum Name { UNITED_STATES_OF_AMERICA }

final nameValues =
    EnumValues({"United States Of America": Name.UNITED_STATES_OF_AMERICA});

class Dma {
  Dma({
    required this.id,
  });

  int id;

  factory Dma.fromJson(Map<String, dynamic> json) => Dma(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class GeneralInfo {
  GeneralInfo({
    required this.generalRule,
    required this.childRule,
  });

  String generalRule;
  String childRule;

  factory GeneralInfo.fromJson(Map<String, dynamic> json) => GeneralInfo(
        generalRule: json["generalRule"] == null ? null : json["generalRule"],
        childRule: json["childRule"],
      );

  Map<String, dynamic> toJson() => {
        "generalRule": generalRule == null ? null : generalRule,
        "childRule": childRule,
      };
}

class Location {
  Location({
    required this.longitude,
    required this.latitude,
  });

  String longitude;
  String latitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
      };
}

class Social {
  Social({
    required this.twitter,
  });

  Twitter twitter;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        twitter: Twitter.fromJson(json["twitter"]),
      );

  Map<String, dynamic> toJson() => {
        "twitter": twitter.toJson(),
      };
}

class Twitter {
  Twitter({
    required this.handle,
  });

  String handle;

  factory Twitter.fromJson(Map<String, dynamic> json) => Twitter(
        handle: json["handle"],
      );

  Map<String, dynamic> toJson() => {
        "handle": handle,
      };
}

class State2 {
  State2({
    required this.name,
    required this.stateCode,
  });

  String name;
  String stateCode;

  factory State2.fromJson(Map<String, dynamic> json) => State2(
        name: json["name"],
        stateCode: json["stateCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "stateCode": stateCode,
      };
}

enum VenueType { VENUE }

final venueTypeValues = EnumValues({"venue": VenueType.VENUE});

class UpcomingEvents {
  UpcomingEvents({
    required this.total,
    required this.tmr,
    required this.ticketmaster,
    required this.filtered,
    required this.ticketweb,
  });

  int total;
  int tmr;
  int ticketmaster;
  int filtered;
  int ticketweb;

  factory UpcomingEvents.fromJson(Map<String, dynamic> json) => UpcomingEvents(
        total: json["_total"],
        tmr: json["tmr"] == null ? null : json["tmr"],
        ticketmaster: json["ticketmaster"],
        filtered: json["_filtered"],
        ticketweb: json["ticketweb"] == null ? null : json["ticketweb"],
      );

  Map<String, dynamic> toJson() => {
        "_total": total,
        "tmr": tmr == null ? null : tmr,
        "ticketmaster": ticketmaster,
        "_filtered": filtered,
        "ticketweb": ticketweb == null ? null : ticketweb,
      };
}

class EventLinks {
  EventLinks({
    required this.self,
    required this.attractions,
    required this.venues,
  });

  First self;
  List<First> attractions;
  List<First> venues;

  factory EventLinks.fromJson(Map<String, dynamic> json) => EventLinks(
        self: First.fromJson(json["self"]),
        attractions: List<First>.from(
            json["attractions"]!.map((x) => First.fromJson(x))),
        venues: List<First>.from(json["venues"]!.map((x) => First.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "attractions": List<dynamic>.from(attractions.map((x) => x.toJson())),
        "venues": List<dynamic>.from(venues.map((x) => x.toJson())),
      };
}

class Outlet {
  Outlet({
    required this.url,
    required this.type,
  });

  String url;
  String type;

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
      };
}

class PriceRange {
  PriceRange({
    required this.type,
    required this.currency,
    required this.min,
    required this.max,
  });

  PriceRangeType? type;
  Currency? currency;
  double min;
  double max;

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        type: priceRangeTypeValues.map[json["type"]],
        currency: currencyValues.map[json["currency"]],
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": priceRangeTypeValues.reverse![type],
        "currency": currencyValues.reverse![currency],
        "min": min,
        "max": max,
      };
}

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

enum PriceRangeType { STANDARD }

final priceRangeTypeValues = EnumValues({"standard": PriceRangeType.STANDARD});

class Product {
  Product({
    required this.name,
    required this.id,
    required this.url,
    required this.type,
    required this.classifications,
  });

  String name;
  String id;
  String url;
  String type;
  List<Classification> classifications;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        id: json["id"],
        url: json["url"],
        type: json["type"],
        classifications: List<Classification>.from(
            json["classifications"]!.map((x) => Classification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "url": url,
        "type": type,
        "classifications":
            List<dynamic>.from(classifications.map((x) => x.toJson())),
      };
}

class Promoter {
  Promoter({
    required this.id,
    required this.name,
    required this.description,
  });

  String id;
  String name;
  String description;

  factory Promoter.fromJson(Map<String, dynamic> json) => Promoter(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class Sales {
  Sales({
    required this.public,
    required this.presales,
  });

  Public public;
  List<Presale>? presales;

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        public: Public.fromJson(json["public"]),
        presales: json["presales"] == null
            ? null
            : List<Presale>.from(
                json["presales"]!.map((x) => Presale.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "public": public.toJson(),
        "presales": presales == null
            ? null
            : List<dynamic>.from(presales!.map((x) => x.toJson())),
      };
}

class Presale {
  Presale({
    required this.startDateTime,
    required this.endDateTime,
    required this.name,
  });

  DateTime startDateTime;
  DateTime endDateTime;
  String name;

  factory Presale.fromJson(Map<String, dynamic> json) => Presale(
        startDateTime: DateTime.parse(json["startDateTime"]),
        endDateTime: DateTime.parse(json["endDateTime"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "startDateTime": startDateTime.toIso8601String(),
        "endDateTime": endDateTime.toIso8601String(),
        "name": name,
      };
}

class Public {
  Public({
    required this.startDateTime,
    required this.startTbd,
    required this.startTba,
    required this.endDateTime,
  });

  DateTime startDateTime;
  bool startTbd;
  bool startTba;
  DateTime endDateTime;

  factory Public.fromJson(Map<String, dynamic> json) => Public(
        startDateTime: DateTime.parse(json["startDateTime"]),
        startTbd: json["startTBD"],
        startTba: json["startTBA"],
        endDateTime: DateTime.parse(json["endDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "startDateTime": startDateTime.toIso8601String(),
        "startTBD": startTbd,
        "startTBA": startTba,
        "endDateTime": endDateTime.toIso8601String(),
      };
}

class Seatmap {
  Seatmap({
    required this.staticUrl,
  });

  String staticUrl;

  factory Seatmap.fromJson(Map<String, dynamic> json) => Seatmap(
        staticUrl: json["staticUrl"],
      );

  Map<String, dynamic> toJson() => {
        "staticUrl": staticUrl,
      };
}

class TicketLimit {
  TicketLimit({
    required this.info,
  });

  String info;

  factory TicketLimit.fromJson(Map<String, dynamic> json) => TicketLimit(
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "info": info,
      };
}

class Ticketing {
  Ticketing({
    required this.healthCheck,
    required this.safeTix,
  });

  HealthCheck healthCheck;
  SafeTix safeTix;

  factory Ticketing.fromJson(Map<String, dynamic> json) => Ticketing(
        healthCheck: HealthCheck.fromJson(json["healthCheck"]),
        safeTix: SafeTix.fromJson(json["safeTix"]),
      );

  Map<String, dynamic> toJson() => {
        "healthCheck": healthCheck.toJson(),
        "safeTix": safeTix.toJson(),
      };
}

class HealthCheck {
  HealthCheck({
    required this.summary,
    required this.description,
    required this.learnMoreUrl,
  });

  String summary;
  String description;
  String learnMoreUrl;

  factory HealthCheck.fromJson(Map<String, dynamic> json) => HealthCheck(
        summary: json["summary"],
        description: json["description"],
        learnMoreUrl: json["learnMoreUrl"],
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "description": description,
        "learnMoreUrl": learnMoreUrl,
      };
}

class SafeTix {
  SafeTix({
    required this.enabled,
  });

  bool enabled;

  factory SafeTix.fromJson(Map<String, dynamic> json) => SafeTix(
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
      };
}

enum EventType { EVENT }

final eventTypeValues = EnumValues({"event": EventType.EVENT});

class WelcomeLinks {
  WelcomeLinks({
    required this.first,
    required this.self,
    required this.next,
    required this.last,
  });

  First first;
  First self;
  First next;
  First last;

  factory WelcomeLinks.fromJson(Map<String, dynamic> json) => WelcomeLinks(
        first: First.fromJson(json["first"]),
        self: First.fromJson(json["self"]),
        next: First.fromJson(json["next"]),
        last: First.fromJson(json["last"]),
      );

  Map<String, dynamic> toJson() => {
        "first": first.toJson(),
        "self": self.toJson(),
        "next": next.toJson(),
        "last": last.toJson(),
      };
}

class Page {
  Page({
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.number,
  });

  int size;
  int totalElements;
  int totalPages;
  int number;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        size: json["size"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "number": number,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
