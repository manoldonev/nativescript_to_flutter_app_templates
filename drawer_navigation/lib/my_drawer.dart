import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String home = '/';
  static const String browse = '/browse';
  static const String search = '/search';
  static const String featured = '/featured';
  static const String settings = '/settings';
}

class DrawerStateInfo with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = Provider.of<DrawerStateInfo>(context).selectedIndex;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('UN'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            accountName: const Text('User Name'),
            accountEmail: const Text('username@mail.com'),
            margin: EdgeInsets.zero,
          ),
          Container(
            color: _selectedIndex == 0
                ? Theme.of(context).accentColor.withAlpha(40)
                : null,
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                if (_selectedIndex == 0) {
                  Navigator.pop(context);
                  return;
                }

                Provider.of<DrawerStateInfo>(context, listen: false)
                    .selectedIndex = 0;
                Navigator.popAndPushNamed(context, Routes.home);
              },
            ),
          ),
          Container(
            color: _selectedIndex == 1
                ? Theme.of(context).accentColor.withAlpha(40)
                : null,
            child: ListTile(
              leading: const Icon(Icons.view_list),
              title: const Text('Browse'),
              selected: _selectedIndex == 1,
              onTap: () {
                if (_selectedIndex == 1) {
                  Navigator.pop(context);
                  return;
                }

                Provider.of<DrawerStateInfo>(context, listen: false)
                    .selectedIndex = 1;
                Navigator.popAndPushNamed(context, Routes.browse);
              },
            ),
          ),
          Container(
            color: _selectedIndex == 2
                ? Theme.of(context).accentColor.withAlpha(40)
                : null,
            child: ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              selected: _selectedIndex == 2,
              onTap: () {
                if (_selectedIndex == 2) {
                  Navigator.pop(context);
                  return;
                }

                Provider.of<DrawerStateInfo>(context, listen: false)
                    .selectedIndex = 2;
                Navigator.popAndPushNamed(context, Routes.search);
              },
            ),
          ),
          Container(
            color: _selectedIndex == 3
                ? Theme.of(context).accentColor.withAlpha(40)
                : null,
            child: ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Featured'),
              selected: _selectedIndex == 3,
              onTap: () {
                if (_selectedIndex == 3) {
                  Navigator.pop(context);
                  return;
                }

                Provider.of<DrawerStateInfo>(context, listen: false)
                    .selectedIndex = 3;
                Navigator.popAndPushNamed(context, Routes.featured);
              },
            ),
          ),
          const Divider(color: Colors.grey),
          Container(
            color: _selectedIndex == 4
                ? Theme.of(context).accentColor.withAlpha(40)
                : null,
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              selected: _selectedIndex == 4,
              onTap: () {
                if (_selectedIndex == 4) {
                  Navigator.pop(context);
                  return;
                }

                Provider.of<DrawerStateInfo>(context, listen: false)
                    .selectedIndex = 4;
                Navigator.popAndPushNamed(context, Routes.settings);
              },
            ),
          ),
        ],
      ),
    );
  }
}
