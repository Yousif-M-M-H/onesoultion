import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onesoultion_task/pages/home/presentation/views/widgets/home_view_body.dart';
import 'package:onesoultion_task/pages/login/views/widgets/decision_tree.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafa),
        title: const Text(
          "Home Page",
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DecisionsTree(),
                  ),
                );
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
