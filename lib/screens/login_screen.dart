// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_logins/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Social Logins 👨‍💻',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            MyButton(
              title: 'Log In with Facebook',
              bgColor: const Color(0XFF1877F2),
              icon: 'assets/images/fb.png',
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              title: 'Log In with Google',
              bgColor: Colors.white,
              icon: 'assets/images/google.png',
              titleColor: Colors.black.withOpacity(0.54),
              onTap: () async {
                await authService.signInWithGoogle();
                // ignore: use_build_context_synchronously
                // Navigator.pushReplacementNamed(context, '/HomeScreen');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logged in with Google')),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              title: 'Log In with Apple',
              bgColor: Colors.black,
              icon: 'assets/images/apple.png',
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              title: 'Log In with Twitter',
              bgColor: const Color(0XFF1D9BF0),
              icon: 'assets/images/twitter.png',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color? titleColor;
  final String icon;
  void Function() onTap;
  MyButton({
    super.key,
    required this.title,
    required this.bgColor,
    required this.icon,
    required this.onTap,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.084),
              blurRadius: 3,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ListTile(
          leading: SizedBox(
            height: 22,
            width: 22,
            child: Image.asset(
              icon,
            ),
          ),
          title: Text(
            title,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 18,
                color: titleColor ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
