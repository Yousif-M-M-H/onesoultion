import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onesoultion_task/pages/login/views/widgets/login_view_body.dart';
import 'package:onesoultion_task/pages/navbar/nav_bar.dart';

class DecisionsTree extends StatefulWidget {
  const DecisionsTree({super.key});

  @override
  State<DecisionsTree> createState() => _DecisionsTreeState();
}

class _DecisionsTreeState extends State<DecisionsTree> {
  User? user;

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  void checkUserLoggedIn() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      setState(() {
        user = currentUser;
      });
    }
  }

  void onRefresh(User userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return LoginViewBody(
        onSignInAno: (userCred) => onRefresh(userCred),
      );
    }
    return const NavBarView();
  }
}
