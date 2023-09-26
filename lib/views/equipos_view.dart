import 'package:flutter/material.dart';
import 'package:gestion_inventario/datatable/equipo_datasource.dart';
import 'package:gestion_inventario/providers/equipo_provider.dart';
import 'package:gestion_inventario/ui/buttons/custom_icon_button.dart';
import 'package:gestion_inventario/ui/modal/equipo_modal.dart';
import 'package:provider/provider.dart';

import '../ui/labels/custom_labels.dart';

class EquipoView extends StatefulWidget {
  const EquipoView({super.key});

  @override
  State<EquipoView> createState() => _EquipoViewState();
}

class _EquipoViewState extends State<EquipoView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<EquipoProvider>(context, listen: false).getEquipos();
  }

  @override
  Widget build(BuildContext context) {
    final equipos = Provider.of<EquipoProvider>(context).equipos;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Inventario', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Numero de Serie')),
              DataColumn(label: Text('Ubicación')),
              DataColumn(label: Text('Estado')),
              DataColumn(label: Text('Acciones')),
            ],
            source: EquipoDTS(equipos),
            header: Text('Registro de equipos', maxLines: 2),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => EquipoModal(equipo: null),
                  );
                },
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
