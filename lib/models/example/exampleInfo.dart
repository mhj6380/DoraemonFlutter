import 'dart:convert';

// 모델타입 쉽게만들어주는 사이트!
// https://app.quicktype.io/

ExampleInfo exampleInfoFromJson(String str) => ExampleInfo.fromJson(json.decode(str));

String exampleInfoToJson(ExampleInfo data) => json.encode(data.toJson());

class ExampleInfo {
    ExampleInfo({
        this.id,
        this.title,
        this.content,
        this.createdAt,
        this.completed,
    });

    int id; 
    String title;
    String content; 
    DateTime createdAt;
    int completed;

    factory ExampleInfo.fromJson(Map<String, dynamic> json) => ExampleInfo(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        completed: json["completed"],
    );
 
    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "completed": completed,
    };
}
