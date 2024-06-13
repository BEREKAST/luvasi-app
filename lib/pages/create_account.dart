import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luvasi/widgets/social_login_button.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crea tu cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prepárate para aumentar tu red de contactos',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Correo',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
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
            SizedBox(height: 16.0),
            TextField(
              controller: repeatPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repetir contraseña',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (passwordController.text != repeatPasswordController.text) {
                    setState(() {
                      errorMessage = 'Las contraseñas no coinciden';
                    });
                    return;
                  }
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cuenta creada exitosamente')),
                    );
                    Navigator.pop(context);
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      if (e.code == 'weak-password') {
                        errorMessage = 'La contraseña es demasiado débil.';
                      } else if (e.code == 'email-already-in-use') {
                        errorMessage = 'El correo electrónico ya está en uso.';
                      } else if (e.code == 'invalid-email') {
                        errorMessage = 'El correo electrónico no es válido.';
                      } else {
                        errorMessage = 'Ocurrió un error: ${e.message}';
                      }
                    });
                  } catch (e) {
                    setState(() {
                      errorMessage = 'Ocurrió un error inesperado: ${e.toString()}';
                    });
                  }
                },
                child: Text('Crea tu cuenta'),
              ),
            ),
            SizedBox(height: 32.0),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("O"),
                ),
                Expanded(child: Divider()),
              ],
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
            SizedBox(height: 16.0),
            SocialLoginButton(
              text: 'Iniciar sesión con Google',
              icon: FontAwesomeIcons.google,
              color: Colors.red,
              onPressed: () {
                // Lógica para iniciar sesión con Google
              },
            ),
          ],
        ),
      ),
    );
  }
}
