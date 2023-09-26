import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: (size.width > 800) ? size.height * 0.1 : null,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(text: 'Terminos de servicios', onPressed: () {}),
            LinkText(text: 'Politicas de privacidad', onPressed: () {}),
            LinkText(text: 'Ayuda', onPressed: () {}),
            LinkText(text: 'Contacto', onPressed: () {}),
            LinkText(text: 'etc', onPressed: () {}),
          ],
        ));
  }
}
