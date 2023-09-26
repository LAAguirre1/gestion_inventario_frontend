import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/logo.png',
            width: 130,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text('Gestion de Inventarios Solmar',
                style: GoogleFonts.fjallaOne(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
