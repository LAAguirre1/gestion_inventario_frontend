import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '404 - Página no encontrada',
        style: GoogleFonts.montserrat(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
