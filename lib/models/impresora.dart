// To parse this JSON data, do
//
//     final impresora = impresoraFromJson(jsonString);

import 'dart:convert';

List<Impresora> impresoraFromJson(String str) =>
    List<Impresora>.from(json.decode(str).map((x) => Impresora.fromJson(x)));

String impresoraToJson(List<Impresora> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Impresora {
  final String impresora;
  final String numSerie;
  final int contadorCopia;
  final String sucursal;
  final String seccion;
  final DateTime ultimoMantenimiento;
  final int id;

  Impresora({
    required this.impresora,
    required this.numSerie,
    required this.contadorCopia,
    required this.sucursal,
    required this.seccion,
    required this.ultimoMantenimiento,
    required this.id,
  });

  Impresora copyWith({
    String? impresora,
    String? numSerie,
    int? contadorCopia,
    String? sucursal,
    String? seccion,
    DateTime? ultimoMantenimiento,
    int? id,
  }) =>
      Impresora(
        impresora: impresora ?? this.impresora,
        numSerie: numSerie ?? this.numSerie,
        contadorCopia: contadorCopia ?? this.contadorCopia,
        sucursal: sucursal ?? this.sucursal,
        seccion: seccion ?? this.seccion,
        ultimoMantenimiento: ultimoMantenimiento ?? this.ultimoMantenimiento,
        id: id ?? this.id,
      );

  factory Impresora.fromJson(Map<String, dynamic> json) => Impresora(
        impresora: json["impresora"],
        numSerie: json["num_serie"],
        contadorCopia: json["contador_copia"],
        sucursal: json["sucursal"],
        seccion: json["seccion"],
        ultimoMantenimiento: DateTime.parse(json["ultimo_mantenimiento"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "impresora": impresora,
        "num_serie": numSerie,
        "contador_copia": contadorCopia,
        "sucursal": sucursal,
        "seccion": seccion,
        "ultimo_mantenimiento":
            "${ultimoMantenimiento.year.toString().padLeft(4, '0')}-${ultimoMantenimiento.month.toString().padLeft(2, '0')}-${ultimoMantenimiento.day.toString().padLeft(2, '0')}",
        "id": id,
      };
}
