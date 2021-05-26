import 'package:flutter/material.dart';

class DrawerSection extends StatelessWidget {
  Widget buildList(String dataTitle, IconData icon , Function onTabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        dataTitle,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
      ),
      onTap: onTabHandler
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(14),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          buildList("Meals", Icons.restaurant , () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildList("Settings", Icons.settings , () {
            Navigator.of(context).pushReplacementNamed("/filters");
          }),
        ],
      ),
    );
  }
}
