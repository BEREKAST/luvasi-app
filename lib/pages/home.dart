import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importar font_awesome_flutter
import 'package:luvasi/widgets/social_login_button.dart';

class HomePage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/luvas.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/luvasi2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Opcional: Añadir un filtro de color para mayor legibilidad
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para iniciar sesión
                      },
                      child: Text('Iniciar Sesión'),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para crear cuenta
                      },
                      child: Text('Crear Cuenta'),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  SocialLoginButton(
                    text: 'Iniciar sesión con Google',
                    icon: FontAwesomeIcons.google, // Usar el icono de Google de font_awesome_flutter
                    color: Colors.red,
                    onPressed: () {
                      // Lógica para iniciar sesión con Google
                    },
                  ),
                  SizedBox(height: 16.0),
                  SocialLoginButton(
                    text: 'Iniciar sesión con Facebook',
                    icon: FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    onPressed: () {
                      // Lógica para iniciar sesión con Facebook
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
