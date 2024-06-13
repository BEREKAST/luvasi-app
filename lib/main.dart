import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/catalog_page.dart'; 
import 'pages/create_account.dart';
//import 'pages/product_detail_page.dart';
// Asegúrate de reemplazar 'pages/home_page.dart' con 'pages/home.dart'

void main() {
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
      home: CreateAccountPage(),
      routes: {
        '/home': (context) => HomePage(),
        //'/catalog': (context) => CatalogPage(),
        '/create-account': (context) => CreateAccountPage(),
        
        // Añade otras rutas aquí si es necesario
      },
    );
  }
}
