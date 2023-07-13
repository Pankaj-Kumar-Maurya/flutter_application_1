import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          //padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    "Pankaj Kumar Maurya",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  accountEmail: Text(
                    "pankajmaurya@gmail.com",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  currentAccountPicture: CircleAvatar(
                      //backgroundImage: NetworkImage("Url"),
                      ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.chart_bar_square,
                color: Colors.white,
              ),
              title: Text(
                "Data",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.lock,
                color: Colors.white,
              ),
              title: Text(
                "Privacy",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person_2,
                color: Colors.white,
              ),
              title: Text(
                "Contect Us",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
