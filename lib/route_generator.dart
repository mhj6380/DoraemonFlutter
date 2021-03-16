import 'package:flutter/material.dart';
import './main.dart';
import './screens/board/boards.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScaffold());
      case '/board':
        return MaterialPageRoute(builder: (_) => SecondPage());

      case '/example':
      // argument 가 String인지 검증하고 라우팅해주도록 하는 예제 
        if (args is String) {
          return MaterialPageRoute(builder: (_) => SecondPage());
        }
      return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("ERROR"),
          ),
          body: Center(
            child: Text("404"),
          ));
    });
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("SECOND!"));
  }
}
