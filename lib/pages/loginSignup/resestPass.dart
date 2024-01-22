import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soundescape/pages/loginSignup/forgotPass.dart';

class resetpass extends StatefulWidget {
  const resetpass({super.key});

  @override
  State<resetpass> createState() => _resetpassState();
}

class _resetpassState extends State<resetpass> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const forgotPassword()));
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset("assets/leaves.png")),
              Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {}, child: const Text("Reset Password"))),
              const SizedBox(
                height: 70,
              ),
              const Text(
                  "Password reset link has been sent to your email address"),
            ],
          ),
        ),
      ),
    );
  }
}
