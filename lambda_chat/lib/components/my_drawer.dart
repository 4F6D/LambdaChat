import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // Get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
            // Logo
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  "lib/icons/Logo.png",
                  height: 100,
                  width: 40,
                ),
              ),
            ),

            // Home list tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: Text("H O M E"),
                leading: Icon(Icons.home),
                onTap: () {
                  // Pop the Drawer
                  Navigator.pop(context);
                },
              ),
            ),

            // Kosmos list tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("K O S M O S"),
                leading: const Icon(Icons.tonality),
                onTap: () {
                  // Pop the Drawer
                  Navigator.pop(context);
                },
              ),
            ),

            // Settings list tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("S E T T I N G S"),
                leading: const Icon(Icons.settings),
                onTap: () {
                  // Pop the Drawer
                  Navigator.pop(context);

                  // Navigate to settings page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(),
                  ));
                },
              ),
            ),
          ],
          ),
          // Logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: const Text("L O G ☹ U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      )
    );
  }
}