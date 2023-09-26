import 'package:fluro/fluro.dart';
import 'package:gestion_inventario/router/admin_handler.dart';
import 'package:gestion_inventario/router/dashboard_handler.dart';
import 'package:gestion_inventario/router/nopagefound_handler.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  static String dashboardRoute = '/dashboard';
  static String equipoRoute = '/dashboard/equipo';
  static String blankRoute = '/dashboard/blank';
  static String tonerRoute = '/toner';
  static String entregasRoute = '/entregas';
  static String impresoraRoute = '/impresoras';

  static void configureRoutes() {
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    //Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);
    router.define(equipoRoute,
        handler: DashboardHandlers.equipos,
        transitionType: TransitionType.fadeIn);
    router.define(tonerRoute,
        handler: DashboardHandlers.toners, transitionType: TransitionType.none);
    router.define(entregasRoute,
        handler: DashboardHandlers.entregas,
        transitionType: TransitionType.none);
    router.define(impresoraRoute,
        handler: DashboardHandlers.impresoras,
        transitionType: TransitionType.none);
    // 404
    router.notFoundHandler = NoPageFoundHandler.noPageFound;
  }
}
