import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts/components/my_button.dart';
import 'package:uts/components/my_textfield.dart';
import 'package:uts/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //mencoba masuk
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book,
              size: 80,
              color: Colors.black,
            ),
            Text("U T S A M P", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 25),
            //ID
            MyTextField(
              hintText: "EMAIL",
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 10),
            //password
            MyTextField(
              hintText: "PASSWORD",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 25),
            MyButton(
              text: "LOGIN",
              onTap: login,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun?"),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "DAFTAR DISINI",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
