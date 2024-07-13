// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

import 'dart:convert';

StoryModel storyModelFromJson(String str) => StoryModel.fromJson(json.decode(str));

String storyModelToJson(StoryModel data) => json.encode(data.toJson());

class StoryModel {
  List<Datum>? data;

  StoryModel({
    this.data,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? date;
  String? name;
  String? category;
  String? location;

  Datum({
    this.date,
    this.name,
    this.category,
    this.location,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    date: json["date"],
    name: json["name"],
    category: json["category"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "name": name,
    "category": category,
    "location": location,
  };
}