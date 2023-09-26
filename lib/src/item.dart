// To parse this JSON data, do
//
//     final itemInventario = itemInventarioFromJson(jsonString);

import 'dart:convert';

List<ItemInventario> itemInventarioFromJson(String str) =>
    List<ItemInventario>.from(
        json.decode(str).map((x) => ItemInventario.fromJson(x)));

String itemInventarioToJson(List<ItemInventario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemInventario {
  int id;
  String nombre;
  String descripcion;
  String numeroSerie;
  String estado;
  String ubicacion;
  String imagen;

  ItemInventario({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.numeroSerie,
    required this.estado,
    required this.ubicacion,
    required this.imagen,
  });

  factory ItemInventario.fromJson(Map<String, dynamic> json) => ItemInventario(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        numeroSerie: json["numero_serie"],
        estado: json["estado"],
        ubicacion: json["ubicacion"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "numero_serie": numeroSerie,
        "estado": estado,
        "ubicacion": ubicacion,
        "imagen": imagen,
      };
}
