import 'package:flutter/material.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.grey,
      ),
      body: Column(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Image.network("https://wallpaperaccess.com/full/427850.jpg"),
            const Positioned(
                bottom: -40,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://www.w3schools.com/howto/img_avatar.png"),
                ))
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Column(
          children: [
            Text(
              "SIGIT SETIYANTO",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "22676004",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Teknik Informatika",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Puri Indah Tembalang",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        )
      ]),
    );
  }
}
