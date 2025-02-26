import 'package:flutter/material.dart';

import '../services/eccommerce_service.dart';
import '../widgets/custom_app_bar.dart';

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
      appBar: CustomAppBar(title: 'E-commerce App'),
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
    );
  }
}
