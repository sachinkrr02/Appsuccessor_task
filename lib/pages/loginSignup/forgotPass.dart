import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soundescape/pages/loginSignup/login.dart';
import 'package:soundescape/pages/loginSignup/resestPass.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController emailController = TextEditingController();

  void passwordReset() async {
    var email = emailController.text.trim();
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

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
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset("assets/leaves.png")),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const Align(
                  alignment: Alignment.centerLeft, child: Text("Email ID")),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Type here...",
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 40),
                        side: const BorderSide(color: Colors.white, width: 1)),
                    onPressed: () {
                      passwordReset();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const resetpass()));
                    },
                    child: const Icon(Icons.arrow_forward)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
