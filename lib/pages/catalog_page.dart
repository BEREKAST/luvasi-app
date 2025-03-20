import 'package:flutter/material.dart';
import 'package:luvasi/models/product.dart';
import 'package:luvasi/pages/product_detail_page.dart';  // Asegúrate de importar product_detail_page.dart

class CatalogPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '00046',
      name: 'frutipiña',
      imageUrl: 'assets/images/frutipiña.png',
      price: 6.0,
      category: 'paletas',
      description: 'piña y frutilla.',
    ),
    Product(
      id: '00047',
      name: 'mango',
      imageUrl: 'assets/images/mango.png',
      price: 6.0,
      category: 'paletas',
      description: 'mango y dumbo.',
    ),
    Product(
      id: '00048',
      name: 'conos',
      imageUrl: 'assets/images/cono.png',
      price: 9.0,
      category: 'lacteo',
      description: 'Leche entera de alta calidad.',
    ),
    Product(
      id: '00049',
      name: 'bananasplit',
      imageUrl: 'assets/images/banana.png',
      price: 25.0,
      category: 'especial',
      description: 'banana helado frutilla',
    ),
    Product(
      id: '00050',
      name: 'Brawni helado',
      imageUrl: 'assets/images/asd.png',
      price: 23.0,
      category: 'masas',
      description: 'ingredientes de alta calidad',
    ),
    Product(
      id: '00051',
      name: 'Crepe helado',
      imageUrl: 'assets/images/crepe.png',
      price: 20.0,
      category: 'Alimentación',
      description: 'Naranjas frescas de Valencia.',
    ),
    Product(
      id: '00052',
      name: 'Copa luva',
      imageUrl: 'assets/images/copa.png',
      price: 25.0,
      category: 'helados',
      description: 'sabor naranja chocolate frutilla mango.',
    ),
    Product(
      id: '00053',
      name: 'Fanta',
      imageUrl: 'assets/images/mango.png',
      price: 18.50,
      category: 'Alimentación',
      description: ' refrescante sabor naranja.',
    ),
    Product(
      id: '00001',
      name: 'Cono frutilla',
      imageUrl: 'assets/images/cono.png',
      price: 9.0,
      category: 'conos',
      description: 'cremoso 3 leches',
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
                  '${product.price.toStringAsFixed(2)} Bs',
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
