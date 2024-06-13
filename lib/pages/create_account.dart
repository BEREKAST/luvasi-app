import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importar font_awesome_flutter
import 'package:luvasi/widgets/social_login_button.dart';

class CreateAccountPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

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
              'Prepárate para disfrutar de nuestros helados',
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
            SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para crear cuenta
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
