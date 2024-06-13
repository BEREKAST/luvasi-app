import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importa las opciones de Firebase
import 'pages/home.dart';
import 'pages/catalog_page.dart'; // Asegúrate de importar catalog_page.dart
import 'pages/create_account.dart';
import 'pages/product_detail_page.dart'; // Importa la página de detalles del producto
import 'pages/order_page.dart'; // Importa la página de pedido

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luvasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/catalog': (context) => CatalogPage(),
        '/create-account': (context) => CreateAccountPage(),
        // Añade otras rutas aquí si es necesario
      },
    );
  }
}
