import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onesoultion_task/core/utils/assets.dart';
import 'package:onesoultion_task/pages/login/views/widgets/login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key, required this.onSignInAno});

  final Function(User) onSignInAno;
  loginano() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    onSignInAno(userCredential.user!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "BMI Calculator",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            ),
            SvgPicture.asset(Assets.assetsImagesSecIcon),
            Center(child: LoginButton(
              onPressed: () {
                loginano();
              },
            )),
          ],
        ),
      ),
    );
  }
}
