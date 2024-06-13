import 'package:flutter/material.dart';
import 'package:luvasi/models/product.dart';
import 'package:luvasi/pages/product_detail_page.dart';  // Asegúrate de importar product_detail_page.dart

class CatalogPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '00046',
      name: 'Leche Desnatada 1L',
      imageUrl: 'assets/images/leche_desnatada.jpg',
      price: 1.20,
      category: 'Bebidas lácteas',
      description: 'Leche desnatada de alta calidad.',
    ),
    Product(
      id: '00047',
      name: 'Leche Semidesnatada 1L',
      imageUrl: 'assets/images/leche_semidesnatada.jpg',
      price: 1.20,
      category: 'Bebidas lácteas',
      description: 'Leche semidesnatada de alta calidad.',
    ),
    Product(
      id: '00048',
      name: 'Leche Entera 1L',
      imageUrl: 'assets/images/leche_entera.jpg',
      price: 1.20,
      category: 'Bebidas lácteas',
      description: 'Leche entera de alta calidad.',
    ),
    Product(
      id: '00049',
      name: 'Aceite de Oliva 1L',
      imageUrl: 'assets/images/aceite_oliva.jpg',
      price: 2.25,
      category: 'Bebidas',
      description: 'Aceite de oliva virgen extra.',
    ),
    Product(
      id: '00050',
      name: 'Aceite de Girasol',
      imageUrl: 'assets/images/aceite_girasol.jpg',
      price: 1.80,
      category: 'Bebidas',
      description: 'Aceite de girasol de alta calidad.',
    ),
    Product(
      id: '00051',
      name: 'Naranja Valenciana',
      imageUrl: 'assets/images/naranja_valenciana.jpg',
      price: 0.75,
      category: 'Alimentación',
      description: 'Naranjas frescas de Valencia.',
    ),
    Product(
      id: '00052',
      name: 'Kas Naranja',
      imageUrl: 'assets/images/kas_naranja.jpg',
      price: 0.45,
      category: 'Alimentación',
      description: 'Bebida gaseosa sabor naranja.',
    ),
    Product(
      id: '00053',
      name: 'Fanta Naranja',
      imageUrl: 'assets/images/fanta_naranja.jpg',
      price: 0.98,
      category: 'Alimentación',
      description: 'Bebida refrescante sabor naranja.',
    ),
    Product(
      id: '00001',
      name: 'Pastillas Lavaplatos',
      imageUrl: 'assets/images/pastillas_lavaplatos.jpg',
      price: 1.67,
      category: 'Limpieza',
      description: 'Pastillas para lavavajillas de alta eficiencia.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: ProductCard(product: product),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '${product.price.toStringAsFixed(2)} €',
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                SizedBox(height: 4),
                Text(
                  product.category,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
