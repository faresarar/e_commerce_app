import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../services/eccommerce_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<dynamic> categories = [
    "All",
    "men's clothing",
    "women's clothing",
    "electronics",
    "jewelery"
  ];
  String selectedCategory = "All";
  int selectedIndex = 0 ;
  List<dynamic> products = [];
  fetchProducts() async {
    EcommerceServices services = EcommerceServices();
    products = await services.fetchProducts();
    setState(() {
      products;
    });
    print(products.toString());
  }
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users List"),
        ],
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: PageView(
        children: [
          HomeScreen(products: products),
          const Text("Page 2"),
          const Text("Page 3"),
        ],
      ),
    );
  }
}
