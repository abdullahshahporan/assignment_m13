import 'package:flutter/material.dart';
class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Pullover',
      'color': 'Black',
      'size': 'L',
      'price': 51,
      'quantity': 1,
      'image': 'assets/pullover.png'
    },
    {
      'name': 'T-Shirt',
      'color': 'Gray',
      'size': 'L',
      'price': 30,
      'quantity': 1,
      'image': 'assets/tshirt.png'
    },
    {
      'name': 'Sport Dress',
      'color': 'Black',
      'size': 'M',
      'price': 43,
      'quantity': 1,
      'image': 'assets/sportdress.png'
    }
  ];

  int getTotalAmount() {
    int total = 0;
    for (var item in cartItems) {
      total += (item['price'] * item['quantity']) as int;
    }
    return total;
  }

  void increaseQuantity(int index) {
    cartItems[index]['quantity']++;
    setState(() {});
  }
  void decreaseQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    }
    setState(() {});
  }
  void onCheckoutPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations on your purchase!'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          item['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Color: ${item['color']} | Size: ${item['size']}',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => decreaseQuantity(index),
                                    icon: Icon(Icons.remove_circle_outline),
                                  ),
                                  Text(
                                    '${item['quantity']}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () => increaseQuantity(index),
                                    icon: Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: (){},
                                icon: Icon(Icons.more_vert)),
                            Text(
                              '${item['price'] * item['quantity']}\$',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Total amount: ${getTotalAmount()}\$',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onCheckoutPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15),
                  ),
                  child: Text('CHECK OUT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}