import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.tealAccent,
      child: ListView(
        children:  [
          UserAccountsDrawerHeader(
            accountName: Text(
              "sanjesh kumar tiwari",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            accountEmail: Text("sanjesh163@gmail.com",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            currentAccountPicture: CircleAvatar(
                child: Text(
                  "S",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                )),
          ),
          SizedBox(
            height: 15,
          ),

          Center(
              child: Text(
                "Address: Sanjayanagar, Bengaluru-56",
                style: TextStyle(
                    fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
              )),
          SizedBox(
            height: 15,
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.black.withOpacity(0.5),
            ),
            title: Text(
              "XXXXXX@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            // Icon()
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black.withOpacity(0.5),
            ),
            title: Text(
              "XXXXXXXXX09",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            // Icon()
          ),


          // Icon()
        ],
      ),
    );
  }
}