import 'dart:convert';

class PostModel {
    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    PostModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory PostModel.fromRawJson(String str) => PostModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
