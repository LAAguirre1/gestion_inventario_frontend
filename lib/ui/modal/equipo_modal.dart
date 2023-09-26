import 'package:flutter/material.dart';
//import 'package:gestion_inventario/providers/equipo_provider.dart';
import 'package:gestion_inventario/services/notification_service.dart';
import 'package:gestion_inventario/ui/buttons/custom_outlined_button.dart';
import 'package:gestion_inventario/ui/imputs/custom_imputs.dart';
//import 'package:provider/provider.dart';

import '../../models/equipo.dart';
import '../labels/custom_labels.dart';

class EquipoModal extends StatefulWidget {
  const EquipoModal({super.key, this.equipo});

  final Equipo? equipo;

  @override
  State<EquipoModal> createState() => _EquipoModalState();
}

class _EquipoModalState extends State<EquipoModal> {
  String nombre = '';
  int? id;
  String descripcion = '';
  String numeroSerie = '';
  String estado = '';
  String ubicacion = '';

  @override
  void initState() {
    super.initState();

    id = widget.equipo?.id;
    nombre = widget.equipo?.nombre ?? '';
    descripcion = widget.equipo?.descripcion ?? '';
    numeroSerie = widget.equipo?.numeroSerie ?? '';
    estado = widget.equipo?.estado ?? '';
    ubicacion = widget.equipo?.ubicacion ?? '';
  }

  @override
  Widget build(BuildContext context) {
    //final equipoProvider = Provider.of<EquipoProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.equipo?.nombre ?? 'Nuevo equipo',
                style: CustomLabels.h1
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          SizedBox(height: 20),
          TextFormField(
            initialValue: widget.equipo?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomImputs.loginImputDecoration(
                hint: 'Nombre del equipo',
                label: 'Equipo',
                icon: Icons.new_releases_outlined),
            style: TextStyle(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                try {
                  if (id == null) {
                    // Crear

                    //await equipoProvider.newEquipo(nombre);
                    NotificationService.showSnackbar('$nombre creado!');
                  } else {
                    // Actualizar
                    //await equipoProvider.updateEquipoy( id!, nombre );
                    NotificationService.showSnackbar('$nombre Actualizado!');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationService.showSnackBarError(
                      'No se pudo guardar la categoría');
                }
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Color(0xff0F2041),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
