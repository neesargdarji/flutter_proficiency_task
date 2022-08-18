// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  HomeResponse({
    required this.title,
    required this.rows,
  });

  String title;
  List<ListRow> rows;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        title: json["title"],
        rows: List<ListRow>.from(json["rows"].map((x) => ListRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
      };
}

class ListRow {
  ListRow({
    required this.title,
    required this.description,
    this.imageHref,
  });

  String? title;
  String? description;
  String? imageHref;

  factory ListRow.fromJson(Map<String, dynamic> json) => ListRow(
        title: json["title"],
        description: json["description"],
        imageHref: json["imageHref"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "imageHref": imageHref,
      };
}
