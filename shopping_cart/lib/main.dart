import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ShoppingScreen(),
    );
  }
}

class Product {
  final String name;
  final IconData icon;
  final String category;
  Product(this.name, this.icon, this.category);
}

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  // Sample product list
  final List<Product> products = [
    Product('Apple', Icons.apple, 'iPhone'),
    Product('T-Shirt', Icons.checkroom, 'Clothing'),
  ];

  final Map<String, int> cart = {};

  void _addProductToCart(Product product) {
    setState(() {
      cart[product.name] = (cart[product.name] ?? 0) + 1;
    });

    Color SnackBarbgColor;
    switch (product.category) {
      case 'iPhone':
        SnackBarbgColor = Colors.orange.shade700;
        break;
      case 'Clothing':
        SnackBarbgColor = Colors.green.shade700;
        break;
      default:
        SnackBarbgColor = Colors.grey.shade700;
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // content: Text('${product.name} added to cart'),
        content: Row(
          children: [
            Icon(product.icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text('${product.name} added to cart')),
          ],
        ),
        backgroundColor: SnackBarbgColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        duration: const Duration(milliseconds: 2000),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.purple,
          onPressed: () {},
        ),
      ),
    );
  }

  int get totalItems =>
      cart.values.fold(0, (previousValue, element) => previousValue + element);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop for Items'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.shopping_cart, size: 30),
                if (totalItems > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints:
                          const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text(
                        '$totalItems',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Icon(product.icon, size: 40, color: Colors.blueAccent),
            title: Text(product.name),
            subtitle: Text(product.category),
            trailing: ElevatedButton(
              child: const Text('Add'),
              onPressed: () => _addProductToCart(product),
            ),
          );
        },
      ),
    );
  }
}