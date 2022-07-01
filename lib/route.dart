part of 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => IntroPage(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => MenuPage(),
        );
      case '/settingNetwork':
        return MaterialPageRoute(
          builder: (_) => SettingPage(),
        );
      case '/testBloc':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TestBlocController(),
            child: TestBloc(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Route Error'),
        ),
        body: Center(
          child: Text('404 Not Found'),
        ),
      );
    });
  }
}
