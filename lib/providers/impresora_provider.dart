import 'package:flutter/material.dart';
import 'package:gestion_inventario/api/inventario_api.dart';
import 'package:gestion_inventario/models/impresora.dart';

class ImpresoraProvider extends ChangeNotifier {
  late List<Impresora> impresoras;

  getImpresoras() async {
    impresoras = [];
    final resp = await InventarioApi.httpGet('/impresora');

    for (var str in resp) {
      impresoras.add(Impresora.fromJson(str));
    }
    notifyListeners();
  }
}
