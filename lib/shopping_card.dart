import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ShoppingCartPage()));
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildAppBarLine(30.0),
                _buildAppBarLine(20.0),
              ],
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
            'Shopping Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        SizedBox(height: 20),

            CartItem(title: 'Lammy Wood Lounge Chair', price: 1109.00, quantity: 1, imageUrl: 'assets/sofa-1 (1).png'),
            SizedBox(height: 10),
            CartItem(title: 'Zara Creation Wood Table', price: 335.00, quantity: 1, imageUrl: 'assets/table.png'),
            SizedBox(height: 10),
            CartItem(title: 'Metal Hanging Light', price: 115.00, quantity: 2, imageUrl: 'assets/light.png'),
            Spacer(),
            OrderSummary(),
            PromoCodeInput(),
            SizedBox(height: 20),
            CheckoutButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined, color: Colors.black), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined, color: Colors.black), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined, color: Colors.black), label: ''),
        ],
      ),
    );
  }
}


class CartItem extends StatelessWidget {
  final String title;
  final double price;
  final int quantity;
  final String imageUrl;

  const CartItem({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, width: 50, height: 50),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(width: 40),

                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {},
                          ),
                          Text(
                            '$quantity',
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(),
        Center(child: Text('Order Summary', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('4 items', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('\$1674.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class PromoCodeInput extends StatelessWidget {
  const PromoCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('PROMO CODE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your code',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: const Color(0xffB6A26D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        onPressed: () {},
        child: const Text('CHECKOUT', style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}

Container _buildAppBarLine(double width) {
  return Container(
    width: width,
    height: 4.0,
    margin: const EdgeInsets.only(bottom: 4.0),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}
