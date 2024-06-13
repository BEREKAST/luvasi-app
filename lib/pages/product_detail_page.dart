import 'package:flutter/material.dart';
import 'package:luvasi/models/product.dart';
import 'package:luvasi/models/cart_item.dart';
import 'package:luvasi/pages/order_page.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  final TextEditingController notesController = TextEditingController();
  final List<CartItem> cartItems = []; // Lista de items en el carrito

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Producto'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      widget.product.imageUrl,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${widget.product.price.toStringAsFixed(2)} Bs',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    widget.product.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16.0),
                  Divider(),
                  Text(
                    'Sugerencias deliciosas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        leading: Image.asset('assets/images/luvas.png', height: 50, width: 50),
                        title: Text('Producto 1'),
                        subtitle: Text('Bs.7.50'),
                      ),
                      ListTile(
                        leading: Image.asset('assets/images/luvas.png', height: 50, width: 50),
                        title: Text('Producto 2'),
                        subtitle: Text('Bs.7.50'),
                      ),
                    ],
                  ),
                  Divider(),
                  Text(
                    'Notas para este producto',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      hintText: 'Escriba las instrucciones que necesita.',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cartItems.add(CartItem(product: widget.product, quantity: quantity));
                          });
                        },
                        child: Text('Añadir al carrito'),
                      ),
                    ],
                  ),
                  SizedBox(height: 60.0), // Añadir espacio para el botón "Ver mi pedido"
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderPage(cartItems: cartItems),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  backgroundColor: Colors.pink, // Cambiar color de fondo del botón si es necesario
                ),
                child: Text(
                  'Ver mi pedido',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
