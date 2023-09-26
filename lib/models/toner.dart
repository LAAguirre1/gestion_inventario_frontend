// To parse this JSON data, do
//
//     final toner = tonerFromJson(jsonString);

import 'dart:convert';

List<Toner> tonerFromJson(String str) =>
    List<Toner>.from(json.decode(str).map((x) => Toner.fromJson(x)));

String tonerToJson(List<Toner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Toner {
  final String nombre;
  final String descripcion;
  final int cantidad;
  final int id;

  Toner({
    required this.nombre,
    required this.descripcion,
    required this.cantidad,
    required this.id,
  });

  Toner copyWith({
    String? nombre,
    String? descripcion,
    int? cantidad,
    int? id,
  }) =>
      Toner(
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        cantidad: cantidad ?? this.cantidad,
        id: id ?? this.id,
      );

  factory Toner.fromJson(Map<String, dynamic> json) => Toner(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cantidad: json["cantidad"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "cantidad": cantidad,
        "id": id,
      };
}
