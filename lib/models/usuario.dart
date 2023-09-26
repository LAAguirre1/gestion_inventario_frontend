// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  String email;
  String username;
  int id;

  Usuario({
    required this.email,
    required this.username,
    required this.id,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        email: json["email"],
        username: json["username"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "id": id,
      };

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        email: json["email"],
        username: json["username"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "id": id,
      };
}
