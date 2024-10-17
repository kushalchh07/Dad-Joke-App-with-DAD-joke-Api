// To parse this JSON data, do
//
//     final dadJOke = dadJOkeFromJson(jsonString);

import 'dart:convert';

DadJOke dadJOkeFromJson(String str) => DadJOke.fromJson(json.decode(str));

String dadJOkeToJson(DadJOke data) => json.encode(data.toJson());

class DadJOke {
    String id;
    String joke;
    int status;

    DadJOke({
        required this.id,
        required this.joke,
        required this.status,
    });

    factory DadJOke.fromJson(Map<String, dynamic> json) => DadJOke(
        id: json["id"],
        joke: json["joke"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "joke": joke,
        "status": status,
    };
}
