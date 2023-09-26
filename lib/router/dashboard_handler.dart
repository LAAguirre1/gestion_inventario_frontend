import 'package:fluro/fluro.dart';
import 'package:gestion_inventario/providers/auth_provider.dart';
import 'package:gestion_inventario/providers/sidemenu_provider.dart';
import 'package:gestion_inventario/router/router.dart';
import 'package:gestion_inventario/views/dashboard_view.dart';
import 'package:gestion_inventario/views/equipos_view.dart';
import 'package:gestion_inventario/views/login_view.dart';
import 'package:gestion_inventario/views/toner_view.dart';
import 'package:gestion_inventario/views/entregas_listview.dart';
import 'package:gestion_inventario/views/impresoras_view.dart';
import 'package:provider/provider.dart';

import '../views/blank_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.dashboardRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, Map<String, List<String>> params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.blankRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const BlankView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler equipos = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.equipoRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return EquipoView();
    } else {
      return LoginView();
    }
  });

  static Handler toners = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.tonerRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return TonerView();
    } else {
      return LoginView();
    }
  });

  static Handler impresoras = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.impresoraRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return ImpresorasView();
    } else {
      return LoginView();
    }
  });

  static Handler entregas = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.entregasRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return EntregasListView();
    } else {
      return LoginView();
    }
  });
}
