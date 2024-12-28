import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Our Products Section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Our Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 3, // Total number of products
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item added to the cart')),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/product${index + 1}.jpg',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text('Product ${index + 1}'),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Hot Offers Section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Hot Offers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2, // Total number of hot offers
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Offer selected')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/offer${index + 1}.avif',
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
