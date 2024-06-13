import 'package:flutter/material.dart';
import 'package:luvasi/models/cart_item.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const OrderPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController shippingTypeController = TextEditingController(text: 'Express');

  @override
  Widget build(BuildContext context) {
    double subtotal = widget.cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);
    double shippingCost = 20.00; // Costo de envío fijo
    double total = subtotal + shippingCost;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Resumen del Pedido',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${subtotal.toStringAsFixed(2)} Bs',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Divider(),
            Text(
              'Envío',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Dirección',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: shippingTypeController,
              decoration: InputDecoration(
                labelText: 'Tipo de envío',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${subtotal.toStringAsFixed(2)} Bs',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Costo de envío',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${shippingCost.toStringAsFixed(2)} Bs',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${total.toStringAsFixed(2)} Bs',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showQrDialog(context, total);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  backgroundColor: Colors.purple, // Cambiar color de fondo del botón si es necesario
                ),
                child: Text(
                  'Completar pedido',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showQrDialog(BuildContext context, double total) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Código QR para Pago'),
          content: Container(
            height: 250,
            width: 250,
            child: QrImageView(
              data: 'Total a pagar: ${total.toStringAsFixed(2)} Bs',
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
