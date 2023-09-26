import 'package:flutter/material.dart';
import 'package:gestion_inventario/api/inventario_api.dart';
import 'package:gestion_inventario/models/equipo.dart';

class EquipoProvider extends ChangeNotifier {
  late List<Equipo> equipos;

  getEquipos() async {
    equipos = [];
    final resp = await InventarioApi.httpGet('/item');

    for (var str in resp) {
      equipos.add(Equipo.fromJson(str));
    }

    notifyListeners();
  }

  Future newEquipo(Equipo equip) async {
    final data = {
      'nombre': equip.nombre,
      'descripcion': equip.descripcion,
      'numero_serie': equip.numeroSerie,
      'estado': equip.estado,
      'ubicacion': equip.ubicacion
    };
    try {
      final json = await InventarioApi.post('/item', data);
      final newEquipo = Equipo.fromJson(json);
      equipos.add(newEquipo);
      notifyListeners();
    } catch (e) {
      throw 'Error al crear equipo';
    }
  }
}
