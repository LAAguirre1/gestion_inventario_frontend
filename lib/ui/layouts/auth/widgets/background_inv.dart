import 'package:flutter/material.dart';

class BackgroundDnd extends StatelessWidget {
  const BackgroundDnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customBoxDecoration(),
    );
  }

  BoxDecoration customBoxDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/fondo.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }
}
