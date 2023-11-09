import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(Icons.star_border),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home),
              title: const Text("H O M E"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.people),
              title: const Text("P R O F I L E"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/profile_pages');
              },
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
