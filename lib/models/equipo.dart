// To parse this JSON data, do
//
//     final equipo = equipoFromJson(jsonString);

import 'dart:convert';

List<Equipo> equipoFromJson(String str) =>
    List<Equipo>.from(json.decode(str).map((x) => Equipo.fromJson(x)));

String equipoToJson(List<Equipo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Equipo {
  String nombre;
  String descripcion;
  String numeroSerie;
  String estado;
  String ubicacion;
  int id;

  Equipo({
    required this.nombre,
    required this.descripcion,
    required this.numeroSerie,
    required this.estado,
    required this.ubicacion,
    required this.id,
  });

  factory Equipo.fromJson(Map<String, dynamic> json) => Equipo(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        numeroSerie: json["numero_serie"],
        estado: json["estado"],
        ubicacion: json["ubicacion"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "numero_serie": numeroSerie,
        "estado": estado,
        "ubicacion": ubicacion,
        "id": id,
      };
}
