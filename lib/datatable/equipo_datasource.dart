import 'package:flutter/material.dart';
import 'package:gestion_inventario/models/equipo.dart';

class EquipoDTS extends DataTableSource {
  final List<Equipo> equipos;

  EquipoDTS(this.equipos);

  @override
  DataRow? getRow(int index) {
    final equipo = equipos[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${equipo.id}')),
        DataCell(Text(equipo.nombre)),
        DataCell(Text(equipo.numeroSerie)),
        DataCell(Text(equipo.ubicacion)),
        DataCell(Text(equipo.estado)),
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            )
          ],
        ))
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => equipos.length;

  @override
  int get selectedRowCount => 0;
}
