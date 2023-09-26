import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/registerform_provider.dart';
import '../router/router.dart';
import '../ui/buttons/link_text.dart';
import '../ui/imputs/custom_imputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Form(
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => registerFormProvider.name = value,
                      decoration: CustomImputs.loginImputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.person_outline_rounded),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => registerFormProvider.email = value,
                      validator: (value) {
                        if (EmailValidator.validate(value ?? '')) {
                          return null;
                        } else {
                          return 'Email inválido';
                        }
                      },
                      decoration: CustomImputs.loginImputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) =>
                          registerFormProvider.password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su contraseña';
                        }
                        if (value.length < 6) {
                          return 'La contraseña debe ser mayor a 6 caracteres';
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
                        child: Text('Registrar'),
                      ),
                      onPressed: () {
                        final validForm = registerFormProvider.validateForm();
                        if (!validForm) return;

                        final authProvider =
                            Provider.of<AuthProvider>(context, listen: false);
                        authProvider.register(
                          registerFormProvider.email,
                          registerFormProvider.password,
                          registerFormProvider.name,
                        );
                      },
                    ),
                    const SizedBox(height: 5),
                    LinkText(
                      text: 'Iniciar sesión',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.loginRoute);
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
}
