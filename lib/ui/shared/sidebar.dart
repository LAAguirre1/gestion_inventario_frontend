import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/sidemenu_provider.dart';
import '../../router/router.dart';
import '../../services/navigation_sevice.dart';
import 'widget/logo.dart';
import 'widget/menu_item_costum.dart';
import 'widget/text_separator.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void naviateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      width: 200,
      height: double.infinity,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          MenuItemCostum(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              text: 'Dashboard',
              icon: Icons.dashboard,
              onPressed: () => naviateTo(Flurorouter.dashboardRoute)),
          const TextSeparator(text: 'Stock Impresoras'),
          MenuItemCostum(
            isActive: sideMenuProvider.currentPage == Flurorouter.entregasRoute,
            text: 'Entregas',
            icon: Icons.repeat_outlined,
            onPressed: () => naviateTo(Flurorouter.entregasRoute),
          ),
          MenuItemCostum(
            isActive: sideMenuProvider.currentPage == Flurorouter.tonerRoute,
            text: 'Toners',
            icon: Icons.water_drop_outlined,
            onPressed: () => naviateTo(Flurorouter.tonerRoute),
          ),
          MenuItemCostum(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.impresoraRoute,
              text: 'Impresoras',
              icon: Icons.print,
              onPressed: () => naviateTo(Flurorouter.impresoraRoute)),
          const TextSeparator(text: 'Menu'),
          MenuItemCostum(
            isActive: sideMenuProvider.currentPage == Flurorouter.equipoRoute,
            text: 'Equipo',
            icon: Icons.computer,
            onPressed: () => naviateTo(Flurorouter.equipoRoute),
          ),
          MenuItemCostum(
              text: 'Usuarios',
              icon: Icons.people_alt_outlined,
              onPressed: () {}),
          const SizedBox(height: 30),
          const TextSeparator(text: 'Elements'),
          MenuItemCostum(
              isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
              text: 'Blank',
              icon: Icons.subdirectory_arrow_right_outlined,
              onPressed: () => naviateTo(Flurorouter.blankRoute)),
          MenuItemCostum(
              text: 'Cerrar Sesión',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }
}
