import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soundescape/pages/homepage/homePage.dart';
import 'package:soundescape/pages/loginSignup/forgotPass.dart';
import 'package:soundescape/pages/loginSignup/signUp.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailError = '';
  String passwordError = '';

  void signin() async {
    var emailAddress = emailController.text.trim();
    var password = passwordController.text.trim();

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          emailError = 'No user found for that email.';
          passwordError = '';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          emailError = '';
          passwordError = 'Wrong password provided for that user.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset("assets/leaves.png"),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 70),
                const Align(
                    alignment: Alignment.centerLeft, child: Text("Email ID")),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    errorText: emailError.isNotEmpty ? emailError : null,
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Enter Password"),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    errorText: passwordError.isNotEmpty ? passwordError : null,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      side: const BorderSide(color: Colors.white, width: 1),
                    ),
                    onPressed: () {
                      signin();
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
                const SizedBox(height: 60),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const forgotPassword()),
                    );
                  },
                  child: const Text("Forgot Password"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()),
                        );
                      },
                      child: const Text(
                        'Sign-Up',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
