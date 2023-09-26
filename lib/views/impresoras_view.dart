import 'package:flutter/material.dart';
import 'package:gestion_inventario/datatable/impresora_datasource.dart';
import 'package:gestion_inventario/providers/providers.dart';
import 'package:provider/provider.dart';

import '../ui/buttons/custom_icon_button.dart';

class ImpresorasView extends StatefulWidget {
  const ImpresorasView({Key? key}) : super(key: key);

  @override
  State<ImpresorasView> createState() => _ImpresorasViewState();
}

class _ImpresorasViewState extends State<ImpresorasView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {
    super.initState();

    Provider.of<ImpresoraProvider>(context, listen: false).getImpresoras();
  }

  @override
  Widget build(BuildContext context) {
    final impresoras = Provider.of<ImpresoraProvider>(context).impresoras;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Impresora')),
              DataColumn(label: Text('Numero de Serie')),
              DataColumn(label: Text('Sucursal')),
              DataColumn(label: Text('Seccion')),
              DataColumn(label: Text('Contador de copia')),
              DataColumn(label: Text('Ultimo mantenimiento')),
              DataColumn(label: Text('Acciones')),
            ],
            source: ImpresoraDTS(impresoras),
            header: Text('Registro de Impresoras', maxLines: 2),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {},
                text: 'Crear',
                icon: Icons.add_outlined,
              ),
            ],
          )
        ],
      ),
    );
  }
}
