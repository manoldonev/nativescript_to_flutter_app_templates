import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_drawer.dart';
import 'home_page.dart';
import 'browse_page.dart';
import 'search_page.dart';
import 'featured_page.dart';
import 'settings_page.dart';
import 'themes/nativescript_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DrawerStateInfo(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Navigation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: NativeScriptTheme.light(),
      darkTheme: NativeScriptTheme.dark(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.home:
            return _FadeInRoute(child: HomePage());
          case Routes.browse:
            return _FadeInRoute(child: BrowsePage());
          case Routes.search:
            return _FadeInRoute(child: SearchPage());
          case Routes.featured:
            return _FadeInRoute(child: FeaturedPage());
          case Routes.settings:
            return _FadeInRoute(child: SettingsPage());
          default:
            throw Exception('unknown route');
        }
      },
    );
  }
}

class _FadeInRoute extends PageRouteBuilder {
  final Widget child;

  _FadeInRoute({this.child})
      : super(
          pageBuilder: (_, __, ___) {
            return child;
          },
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
