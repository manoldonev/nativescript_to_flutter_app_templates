import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_drawer.dart';
import 'home_page.dart';
import 'browse_page.dart';
import 'search_page.dart';
import 'featured_page.dart';
import 'settings_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DrawerStateInfo(),
    child: MyApp(),
  ));
}

class CustomPalettes {
  static const MaterialColor nativeScriptBlue = MaterialColor(
    0xff3e5bfe,
    <int, Color>{
      50: Color(0xffe8ebff),
      100: Color(0xffc5ceff),
      200: Color(0xff9fadff),
      300: Color(0xff788cfe),
      400: Color(0xff5b74fe),
      500: Color(0xff3e5bfe),
      600: Color(0xff3853fe),
      700: Color(0xff3049fe),
      800: Color(0xff2840fe),
      900: Color(0xff1b2ffd),
    },
  );

  static const MaterialColor nativeScriptBlueDark = MaterialColor(
    0xff212121,
    <int, Color>{
      50: Color(0xfff2f2f2),
      100: Color(0xffe6e6e6),
      200: Color(0xffcccccc),
      300: Color(0xffb3b3b3),
      400: Color(0xff999999),
      500: Color(0xff808080),
      600: Color(0xff666666),
      700: Color(0xff4d4d4d),
      800: Color(0xff333333),
      900: Color(0xff191919),
    },
  );
}

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Navigation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: CustomPalettes.nativeScriptBlue,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff3e5bfe),
        accentColor: Color(0xff30bcff),
      ),
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
