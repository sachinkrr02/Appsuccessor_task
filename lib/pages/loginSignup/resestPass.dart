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
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => forgotPassword()));
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
                alignment: Alignment.topLeft,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Password reset link has been sent to your email address",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
