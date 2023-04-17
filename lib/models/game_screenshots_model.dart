// To parse this JSON data, do
//
//     final screenShotsGameModel = screenShotsGameModelFromJson(jsonString);

import 'dart:convert';

ScreenShotsGameModel screenShotsGameModelFromJson(String str) =>
    ScreenShotsGameModel.fromJson(json.decode(str));

String screenShotsGameModelToJson(ScreenShotsGameModel data) =>
    json.encode(data.toJson());

class ScreenShotsGameModel {
  ScreenShotsGameModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final String? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  factory ScreenShotsGameModel.fromJson(Map<String, dynamic> json) =>
      ScreenShotsGameModel(
        count: json["count"].toString(),
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.image,
    this.width,
    this.height,
    this.isDeleted,
  });

  final String? id;
  final String? image;
  final String? width;
  final String? height;
  final bool? isDeleted;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"].toString(),
        image: json["image"],
        width: json["width"].toString(),
        height: json["height"].toString(),
        isDeleted: json["is_deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "width": width,
        "height": height,
        "is_deleted": isDeleted,
      };
}
