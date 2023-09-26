import 'package:flutter/material.dart';

import '../../providers/sidemenu_provider.dart';
import 'widget/navbar_avatar.dart';
import 'widget/notificaciones_indicador.dart';
import 'widget/search_text.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        children: <Widget>[
          if (size.width <= 700)
            IconButton(
              icon: Icon(Icons.menu,
                  color: Theme.of(context).colorScheme.onPrimary),
              onPressed: () => SideMenuProvider.openMenu(),
            ),
          const SizedBox(width: 5),

          //Search input
          if (size.width > 400)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),
          const Spacer(),
          const NotificacionIndicador(),
          const SizedBox(width: 10),
          const NavbarAvatar(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration decorationCustom() => const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
