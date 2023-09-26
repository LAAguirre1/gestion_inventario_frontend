import 'package:flutter/material.dart';
import 'package:gestion_inventario/api/inventario_api.dart';

import '../models/equipo.dart';

class EquipoFormProvider extends ChangeNotifier {
  Equipo? equipo;
  late GlobalKey<FormState> formKey;

  copyEquipoWith({
    String? nombre,
    String? descripcion,
    String? ubicacion,
    String? estado,
    String? numeroSerie,
    int? id,
  }) {
    equipo = Equipo(
      nombre: nombre ?? equipo!.nombre,
      descripcion: descripcion ?? equipo!.descripcion,
      numeroSerie: numeroSerie ?? equipo!.numeroSerie,
      estado: estado ?? equipo!.estado,
      ubicacion: ubicacion ?? equipo!.ubicacion,
      id: id ?? equipo!.id,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future updateEquipo() async {
    if (!_validForm()) return false;

    final data = {
      'nombre': equipo!.nombre,
      'descripcion': equipo!.descripcion,
      'numeroSerie': equipo!.numeroSerie,
      'estado': equipo!.estado,
      'ubicacion': equipo!.ubicacion,
    };

    try {
      final res = await InventarioApi.put('/item/${equipo!.id}', data);
      print(res);
      return true;
    } catch (e) {
      print('Error en updateequipo: $e');
      return false;
    }
  }
}
