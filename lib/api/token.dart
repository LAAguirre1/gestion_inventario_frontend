import 'dart:convert';

class Token {
  Token({
    required this.accessToken,
    required this.tokenType,
  });

  String accessToken;
  String tokenType;

  factory Token.fromJson(String str) => Token.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );
  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
