import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/loginform_provider.dart';
import '../router/router.dart';
import '../ui/buttons/link_text.dart';
import '../ui/imputs/custom_imputs.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Form(
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (_) =>
                          onFormSubmit(loginFormProvider, authProvider),
                      validator: (value) {
                        if ((value != null) && (value.length >= 3)) {
                          return null;
                        } else {
                          return 'Nombre inválido';
                        }
                      },
                      onChanged: (value) => loginFormProvider.username = value,
                      decoration: CustomImputs.loginImputDecoration(
                          hint: 'Ingrese su nombre de usuario',
                          label: 'Usuario',
                          icon: Icons.supervised_user_circle_outlined),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onFieldSubmitted: (_) =>
                          onFormSubmit(loginFormProvider, authProvider),
                      onChanged: (value) => loginFormProvider.password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su contraseña';
                        }
                        if (value.length < 4) {
                          return 'La contraseña debe ser mayor a 4 caracteres';
                        }
                        return null;
                      },
                      decoration: CustomImputs.loginImputDecoration(
                        hint: 'Ingrese su contraseña',
                        label: 'Contraseña',
                        icon: Icons.lock_outlined,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text('Ingresar'),
                      ),
                      onPressed: () =>
                          onFormSubmit(loginFormProvider, authProvider),
                    ),
                    const SizedBox(height: 5),
                    LinkText(
                      text: '¿No tienes una cuenta?',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.registerRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      authProvider.login(
        loginFormProvider.username,
        loginFormProvider.password,
      );
    }
  }
}
