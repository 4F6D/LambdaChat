import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_chat/services/auth/auth_service.dart';
import 'package:lambda_chat/components/my_button.dart';
import 'package:lambda_chat/components/my_textfield.dart';

class LoginPage extends StatelessWidget {

  // Email und pw text controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // LOGIN METHOD
  void login(BuildContext context) async {
    // Auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    }
    // Catch Errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // logo
            Container(
              height: 80,
              child: Image.asset("lib/icons/Logo.png"),
            ),
            const SizedBox(height: 50,),

            // welcome back message
            Text("Wilkommen zurück!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            // pw textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 25),

            // login button
            MyButton(
                text: 'Login',
              onTap: () => login(context),
            ),

            const SizedBox(height: 25),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Instragram zu anstrengend? ", style: TextStyle(
                    color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Registrier dich jetzt!", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}