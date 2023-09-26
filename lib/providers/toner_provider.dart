import 'package:flutter/material.dart';
import 'package:gestion_inventario/api/inventario_api.dart';
import 'package:gestion_inventario/models/toner.dart';

class TonerProvider extends ChangeNotifier {
  late List<Toner> toners;

  getToners() async {
    toners = [];
    final resp = await InventarioApi.httpGet('/toner');

    for (var str in resp) {
      toners.add(Toner.fromJson(str));
    }
    notifyListeners();
  }
}
