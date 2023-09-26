import 'package:fluro/fluro.dart';
import 'package:gestion_inventario/providers/auth_provider.dart';
import 'package:gestion_inventario/views/dashboard_view.dart';
import 'package:gestion_inventario/views/login_view.dart';
import 'package:gestion_inventario/views/register_view.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc: (context, Map<String, List<String>> parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const LoginView();
      } else {
        return const DashboardView();
      }
    },
  );

  static Handler register = Handler(
    handlerFunc: (context, Map<String, List<String>> parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const RegisterView();
      } else {
        return const DashboardView();
      }
    },
  );
}
