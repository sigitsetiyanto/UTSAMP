import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts/components/my_button.dart';
import 'package:uts/components/my_textfield.dart';
import 'package:uts/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void registerUser() async {
    //loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //memastikan password harus sama
    if (passwordController.text != confirmPwController.text) {
      Navigator.pop(context);

      displayMessageToUser("Password Tidak Sama", context);
    } else {
      //membuat user
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        displayMessageToUser(e.code, context);
      }
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
            const Icon(
              Icons.book,
              size: 80,
              color: Colors.black,
            ),
            Text("U T S A M P", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 25),
            MyTextField(
              hintText: "USERNAME",
              obscureText: false,
              controller: usernameController,
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            MyTextField(
              hintText: "CONFIRM PASSWORD",
              obscureText: true,
              controller: confirmPwController,
            ),
            const SizedBox(height: 25),
            MyButton(
              text: "REGISTER",
              onTap: registerUser,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah Punya Akun?"),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "LOGIN SEKARANG",
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
