import 'package:flutter/material.dart';
import 'package:restaurant_mobile_application/drawer.dart';

class Home extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final List<Map<String, dynamic>> cardDetails = [
    {
      'title': 'Cheese Burger',
      'subtitle': 'A Classic Delight',
      'description':
          'Indulge in the timeless favorite - a juicy cheese burger with a perfect balance of savory beef, melted cheese, and fresh toppings. Experience a burst of flavors with every bite.',
      'image1': 'assets/burger1.jpg',
      'price': 'LKR 1700',
    },
    {
      'title': 'Chicken Drumsticks',
      'subtitle': 'Flavorful Feast',
      'description':
          'Savor the taste of perfectly seasoned chicken drumsticks, grilled to perfection for a crispy exterior and juicy interior. Ideal for any meal, these drumsticks are sure to please.',
      'image1': 'assets/chicken.jpg',
      'price': 'LKR 1600',
    },
    {
      'title': 'Cheese Pasta',
      'subtitle': 'Creamy Indulgence',
      'description':
          'Delight in a rich and creamy cheese pasta that melts in your mouth. This comforting dish combines perfectly cooked pasta with a luscious cheese sauce for an unforgettable meal.',
      'image1': 'assets/pasta.jpg',
      'price': 'LKR 1800',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/burger.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            children: <Widget>[
              AppBar(
                title: Text(
                  'Login In To Your Account',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.orange.withOpacity(0.5),
                elevation: 0.0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: cardDetails.length,
                  itemBuilder: (context, index) {
                    final cardDetail = cardDetails[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      color: Colors.orange.withOpacity(0.8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            ListTile(
                              textColor: Colors.white,
                              leading: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Colors.white,
                              ),
                              title: Text(
                                cardDetail['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                cardDetail['subtitle'],
                                style: TextStyle(
                                    color: Colors.white.withOpacity(1),
                                    fontSize: 15.0),
                              ),
                            ),
                            cardDetail['image1'] != null
                                ? Image.asset(cardDetail['image1'])
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                cardDetail['description'],
                                style: TextStyle(
                                    color: Colors.white.withOpacity(1),
                                    fontSize: 15.0),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: const Text('Add to Cart'),
                                ),
                                Text(
                                  cardDetail['price'],
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
