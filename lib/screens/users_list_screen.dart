import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../services/eccommerce_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/users_card.dart';
import '../widgets/users_solid_card.dart';
import 'user_profile_screen.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    users = await EcommerceServices().fetchUsers();
    setState(() {
      users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Users"),
      body: users.isEmpty
          ? Skeletonizer(
              enabled: users.isEmpty,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return const UsersSolidCard();
                },
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfile(
                          user: users[index],
                        ),
                      ),
                    );
                  },
                  child: UsersCard(
                    user: users[index],
                  ),
                );
              },
            ),
    );
  }
}
