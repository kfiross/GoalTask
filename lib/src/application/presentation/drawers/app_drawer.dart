
import 'package:flutter/material.dart';
import 'package:goal_task/src/core/utils/size_config.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

final drawerTitleStyle = TextStyle(
  fontSize: SizeConfig.font.medium,
);

class DrawerItem {
  final String title;
  final IconData? icon;
  final VoidCallback? onPressed;

  DrawerItem({required this.title, this.icon, this.onPressed});
}

class AppDrawerNavigation extends StatelessWidget {

  AppDrawerNavigation({Key? key}) : super(key: key);

  final prefsBox = Hive.box('prefs');
  final profileBox = Hive.box('profile');

  Widget _drawerHeader(BuildContext context) {
    return SizedBox(
      height: 124,
      child: DrawerHeader(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 4, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue[700],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    final drawerItems = [];

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(context),
          ...drawerItems.map((item) {
            return ListTile(
              leading: Icon(item.icon),
              title: Text(
                item.title,
                style: drawerTitleStyle,
              ),
              onTap: () {
                // close the drawer first
                Navigator.pop(context);

                item.onPressed?.call();
              },
            );
          }).toList(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              "Logout",
            ),
            onTap: () async {

            },
          ),
        ],
      ),
    );
  }
}
