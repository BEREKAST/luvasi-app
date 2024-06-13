import 'package:flutter/material.dart';
import 'package:luvasi/models/product.dart';
import 'package:luvasi/pages/product_detail_page.dart';

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
    // Añadir otros productos
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
