import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_logins/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
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
            const SizedBox(height: 30),
            MyButton(
              title: 'Log In with Facebook',
              bgColor: const Color(0XFF1877F2),
              icon: 'assets/images/fb.png',
              onTap: () {
                // Implement Facebook sign-in logic
              },
            ),
            const SizedBox(height: 20),
            MyButton(
              title: 'Log In with Google',
              bgColor: Colors.white,
              icon: 'assets/images/google.png',
              titleColor: Colors.black.withOpacity(0.54),
              onTap: () async {
                User? user = await authService.signInWithGoogle();
                if (user != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logged in as ${user.displayName ?? 'User'}')),
                  );
                  // Navigate to home screen or another screen
                  // Navigator.pushReplacementNamed(context, '/HomeScreen');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to log in with Google')),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            MyButton(
              title: 'Log In with Apple',
              bgColor: Colors.black,
              icon: 'assets/images/apple.png',
              onTap: () {
                // Implement Apple sign-in logic
              },
            ),
            const SizedBox(height: 20),
            MyButton(
              title: 'Log In with Twitter',
              bgColor: const Color(0XFF1D9BF0),
              icon: 'assets/images/twitter.png',
              onTap: () {
                // Implement Twitter sign-in logic
              },
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
  final void Function() onTap;

  MyButton({
    required this.title,
    required this.bgColor,
    required this.icon,
    required this.onTap,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            child: Image.asset(icon),
          ),
          title: Text(
            title,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              color: titleColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
