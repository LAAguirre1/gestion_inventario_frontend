import 'package:flutter/material.dart';

import '../ui/cards/white_card.dart';
import '../ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('BlankView', style: CustomLabels.h1),
        const SizedBox(height: 10),
        const WhiteCard(title: 'Sales Statistics', child: Text('Hola Mundo')),
      ],
    );
  }
}
