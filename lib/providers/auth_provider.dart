import 'package:flutter/material.dart';
import 'package:gestion_inventario/api/inventario_api.dart';
import 'package:gestion_inventario/api/token.dart';
import 'package:gestion_inventario/router/router.dart';
import 'package:gestion_inventario/services/local_storage.dart';
import 'package:gestion_inventario/services/navigation_sevice.dart';
import 'package:gestion_inventario/services/notification_service.dart';

enum AuthStatus {
  notAuthenticated,
  authenticating,
  authenticated,
}

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.authenticating;
  Token? token;

  AuthProvider() {
    isAuthenticated();
  }

  login(String username, String password) {
    final data = {'username': username, 'password': password};

    InventarioApi.post('/login/access-token', data).then((json) {
      token = Token.fromMap(json);
      LocalStorage.prefs.setString('token', token!.accessToken);
      authStatus = AuthStatus.authenticated;
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      InventarioApi.configureDio();
      notifyListeners();
    }).catchError((error) {
      final msj = error.toString();
      NotificationService.showSnackBarError(msj);
    });
  }

  register(String email, String password, String name) {
    final data = {
      "email": email,
      "username": name,
      "password": password,
    };

    InventarioApi.postJson('/user/', data).then((json) {}).catchError((e) {
      final msj = e.toString();
      NotificationService.showSnackBarError(msj);
    });

    //authStatus = AuthStatus.authenticated;
    //LocalStorage.prefs.setString('token', _token!);
    //NavigationService.replaceTo(Flurorouter.dashboardRoute);
    //notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    // InventarioApi.httpGet('/item').then((value) {
    //   authStatus = AuthStatus.authenticated;
    //   notifyListeners();
    //   return true;
    // }).catchError((e) {
    //   authStatus = AuthStatus.notAuthenticated;
    //   notifyListeners();
    //   return false;
    // });
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
