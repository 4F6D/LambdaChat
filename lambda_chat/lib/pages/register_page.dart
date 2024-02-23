import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {

  // Email und pw text controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Tap to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // Register method
  void register() {}

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
            Text("Für echte Interaktionen brauchst du keine Filter.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            Text("Registriere dich hier und sei einfach du selbst.",
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

            // password textfield
            MyTextField(
              hintText: "Passwort",
              obscureText: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 10),

            // confirm password
            MyTextField(
              hintText: "Bestätige dein Passwort",
              obscureText: true,
              controller: _confirmPasswordController,
            ),

            const SizedBox(height: 25),

            // login button
            MyButton(
              text: 'Register',
              onTap: register,
            ),

            const SizedBox(height: 25),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bereits Mitglied? ", style: TextStyle(
                    color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Dann log dich ein!", style: TextStyle(
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