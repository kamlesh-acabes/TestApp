// To parse this JSON data, do
//
//     final myAlbum = myAlbumFromJson(jsonString);

import 'dart:convert';

MyAlbum myAlbumFromJson(String str) => MyAlbum.fromJson(json.decode(str));

String myAlbumToJson(MyAlbum data) => json.encode(data.toJson());

class MyAlbum {
  int userId;
  int id;
  String title;

  MyAlbum({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory MyAlbum.fromJson(Map<String, dynamic> json) => MyAlbum(
    userId: json["userId"] ?? 0,
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
