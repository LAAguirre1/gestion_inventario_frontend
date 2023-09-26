import 'package:flutter/material.dart';
import 'package:gestion_inventario/models/impresora.dart';

class ImpresoraDTS extends DataTableSource {
  final List<Impresora> impresoras;

  ImpresoraDTS(this.impresoras);

  @override
  DataRow? getRow(int index) {
    final impresora = impresoras[index];
    final fec = impresora.ultimoMantenimiento;

    return DataRow.byIndex(cells: [
      DataCell(Text(impresora.impresora)),
      DataCell(Text(impresora.numSerie)),
      DataCell(Text(impresora.sucursal)),
      DataCell(Text(impresora.seccion)),
      DataCell(Text('${impresora.contadorCopia}')),
      DataCell(Text('${fec.day}-${fec.month}-${fec.year}')),
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
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => impresoras.length;

  @override
  int get selectedRowCount => 0;
}
