import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHOPPING',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signIn': (context) => const SignInScreen(),
        '/productList': (context) => ProductListScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SHOPPING',
                style: TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 100),
              const Text(
                'Amazing shopping',
                style: TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Experience a new way',
                style: TextStyle(
                    color: Colors.indigoAccent, fontWeight: FontWeight.bold),
              ),
              const Text(
                'of shopping.',
                style: TextStyle(
                    color: Colors.indigoAccent, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 180),
              ElevatedButton(
                onPressed: () {
                  bool isSignedIn = false;
                  if (isSignedIn) {
                    Navigator.pushNamed(context, '/productList');
                  } else {
                    Navigator.pushNamed(context, '/signIn');
                  }
                },
                child: const Text(
                  'Explore',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/productList');
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Chair',
      'price': 879.00,
      'image': 'assets/images/orange_chair.jpg',
      'color': Colors.white,
    },
    {
      'name': 'Bike',
      'price': 2800.00,
      'image': 'assets/images/bike.png',
      'color': Colors.white,
    },
    {
      'name': 'Trash Bin',
      'price': 120.00,
      'image': 'assets/images/bottle.png',
      'color': Colors.white,
    },
    {
      'name': 'Backpack',
      'price': 95.00,
      'image': 'assets/images/bag.jpg',
      'color': Colors.white,
    },
  ];

  final List<String> categories = ['New', 'Furniture', 'Electronic', 'Fashion'];

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category tabs
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: index == 0 ? Colors.black : Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Grid
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            name: product['name'],
                            price: product['price'],
                            image: product['image'],
                            color: product['color'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: product['color'],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${product['price'].toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Icon(Icons.more_horiz),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final Color color;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        color: color,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(image),
              ),
            ),
            const SizedBox(height: 20),
            Text(name,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text('\$${price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, color: Colors.black)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart!')),
                );
              },
              child: const Text("Add to Cart"),
            )
          ],
        ),
      ),
    );
  }
}
