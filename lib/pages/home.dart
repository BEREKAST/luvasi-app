import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importar font_awesome_flutter
import 'package:luvasi/widgets/social_login_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  // Función para validar el formato del correo electrónico
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegExp.hasMatch(email);
  }

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
          Center(
            child: SingleChildScrollView(
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
                    SizedBox(height: 16.0),
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 32.0),
                    FractionallySizedBox(
                      widthFactor: 0.6,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            errorMessage = ''; // Limpiar mensaje de error antes de intentar iniciar sesión
                          });

                          final email = emailController.text.trim();
                          if (!isValidEmail(email)) {
                            setState(() {
                              errorMessage = 'El formato del correo electrónico no es válido.';
                            });
                            return;
                          }

                          try {
                            print('Intentando iniciar sesión con: $email');
                            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email,
                              password: passwordController.text,
                            );
                            print('Inicio de sesión exitoso: ${userCredential.user}');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Inicio de sesión exitoso')),
                            );
                            Navigator.pushNamed(context, '/catalog'); // Navega a la pantalla del catálogo después de iniciar sesión
                          } on FirebaseAuthException catch (e) {
                            print('Error de FirebaseAuth: ${e.code}');
                            setState(() {
                              if (e.code == 'user-not-found') {
                                errorMessage = 'No se encontró un usuario con ese correo.';
                              } else if (e.code == 'wrong-password') {
                                errorMessage = 'Contraseña incorrecta.';
                              } else {
                                errorMessage = 'Ocurrió un error: ${e.message}';
                              }
                            });
                          } catch (e) {
                            print('Error inesperado: $e');
                            setState(() {
                              errorMessage = 'Ocurrió un error inesperado: ${e.toString()}';
                            });
                          }
                        },
                        child: Text('Iniciar Sesión'),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    FractionallySizedBox(
                      widthFactor: 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/create-account');
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
          ),
        ],
      ),
    );
  }
}
