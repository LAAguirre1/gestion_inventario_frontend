import 'package:flutter/material.dart';

import '../../imputs/custom_imputs.dart';

class SearchText extends StatelessWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 3),
      decoration: buildBoxDecoration(context),
      child: TextField(
        decoration: CustomImputs.searchInputDecoration(
          hint: 'Buscar',
          icon: Icons.search_outlined,
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
