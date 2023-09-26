import 'package:flutter/material.dart';
import 'package:gestion_inventario/providers/providers.dart';
import 'package:provider/provider.dart';

import '../ui/cards/white_card.dart';

class TonerView extends StatefulWidget {
  const TonerView({Key? key}) : super(key: key);

  @override
  State<TonerView> createState() => _TonerViewState();
}

class _TonerViewState extends State<TonerView> {
  @override
  void initState() {
    super.initState();

    Provider.of<TonerProvider>(context, listen: false).getToners();
  }

  @override
  Widget build(BuildContext context) {
    final toners = Provider.of<TonerProvider>(context).toners;
    return ListView.builder(
      itemCount: toners.length,
      itemBuilder: (context, index) {
        return WhiteCard(
          title: toners[index].nombre,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(toners[index].descripcion),
              Text(
                'Stock: ${toners[index].cantidad}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
