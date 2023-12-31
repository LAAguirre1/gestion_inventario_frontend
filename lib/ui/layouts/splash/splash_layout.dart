import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Cargando...'),
        ],
      ),
    ));
  }
}
