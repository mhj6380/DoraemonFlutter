import 'package:flutter/material.dart';
import 'globalfunction.dart';
import 'package:doraemon/providers/splash.dart';
import 'package:doraemon/providers/auth.dart';
import './globalfunction.dart';
import 'package:provider/provider.dart';
import './auth/LoginPage.dart';
import './auth/RegisterPage.dart';
import './screens/locationDetail.dart';
import './screens/board/boards.dart';
import './screens/frame/mainAppBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './screens/mypage/mypage.dart';
import './screens/home/home.dart';
import './screens/pageview/pageview.dart';
import './route_generator.dart';
import './example/sqliteExample.dart';

void main() {
  runApp(MyApp());
}

CarouselSlider MainSlideBanner() {
  List<String> bannerList = [
    "https://img.insight.co.kr/static/2018/10/08/700/9k7128gqt7t0ee1kxia7.jpg",
    "https://dailygrid.net/news/photo/201911/312526_211061_5533.png"
  ];

  return CarouselSlider(
    options: CarouselOptions(
      height: 250.0,
      viewportFraction: 1,
      autoPlay: true,
    ),
    items: [0, 1].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                bannerList[i],
                fit: BoxFit.cover,
              ));
        },
      );
    }).toList(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doraemon Plate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider<Splash>(
              create: (c) => Splash(),
            ),
            ChangeNotifierProvider<Auth>(
              create: (c) => Auth(),
            ),
          ],
          child: SafeArea(child: MainScaffold()
              // ManyPageView()
              )),
    );
  }
}

class MainScaffold extends StatelessWidget {
  final bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    // var paddingTop = MediaQuery.of(context).padding.top;
    var mainAppBar = MainAppBar(
      title: Text('Provier',
          style: TextStyle(
              fontSize: 20,
              color: HexColor.fromHex("#ff5349"),
              fontWeight: FontWeight.w900)),
    );

    if (!isLoggedIn) {
      return Consumer<Auth>(
          builder: (context, value, child) => Center(
              child: value.getAuthPath() == 'login'
                  ? LocationDetail()
                  // LoginPage()
                  : RegisterPage()));
    } else {
      return ChangeNotifierProvider<Splash>(
        create: (context) => Splash(),
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "HAKGU",
                style: TextStyle(
                    color: HexColor.fromHex("#08415d"),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: HexColor.fromHex("#ffffff"),
            // leading: IconButton(
            //   icon: Icon(Icons.chevron_left),
            //   onPressed: () => Navigator.pop(context),
            //   color: Colors.black,
            // ),
          ), 
          body: SingleChildScrollView(
            child: Consumer<Splash>(builder: (context, value, child) {
              return IndexedStack(
                index: value.getBottomNaviFocus(), 
                children: [
                  Home(),
                  // ManyPageView(),
                  // SqlliteExample(), 
                  Boards(mainAppBar: mainAppBar),
                  Mypage(mainAppBar: mainAppBar)
                ],
              );
            }),
          ),
          bottomNavigationBar: BasicBottomNavigationBar(),
        ),
      );
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.mainAppBar,
  }) : super(key: key);

  final MainAppBar mainAppBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // mainAppBar,
        Container(
          height: 300,
          color: Colors.red,
        ),
        Container(
          height: 300,
          color: Colors.blue,
        ),
        Container(
          height: 300,
          color: Colors.green,
        ),
        Container(
          height: 300,
          color: Colors.amber,
        )
      ],
    );
  }
}

class ContentPage extends StatelessWidget {
  const ContentPage({
    Key key,
    @required this.mainAppBar,
  }) : super(key: key);

  final MainAppBar mainAppBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // mainAppBar,
        Container(
          height: 300,
          color: Colors.green,
        ),
        Container(
          height: 300,
          color: Colors.amber,
        ),
        Container(
          height: 300,
          color: Colors.red,
        ),
        Container(
          height: 300,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyModel {
  int _counter;
  int get counter => _counter;
  String _name;
  String get name => _name;
  MyModel(this._counter, this._name);
}

class BasicBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 50,
      color: HexColor.fromHex("#ffffff"),
      child: Row(
        children: [
          // value.getBottomNaviFocus().toString()
          BottomNavigationItem(
              path: 0, icon: Icon(Icons.mark_chat_unread_outlined)),
          BottomNavigationItem(path: 1, icon: Icon(Icons.looks_one_outlined)),
          BottomNavigationItem(
              path: 2, icon: Icon(Icons.insert_emoticon_sharp)),
        ],
      ),
    ));
  }
}

class BottomNavigationItem extends StatelessWidget {
  final int path;
  final Widget icon;

  const BottomNavigationItem({Key key, this.path, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Consumer<Splash>(
            builder: (context, value, child) => Center(
                    child: IconButton(
                  onPressed: () => {
                    // Navigator.of(context).pushNamed('/second');
                    Provider.of<Splash>(context, listen: false)
                        .changeBottomNaiveFocus(path)
                  },
                  icon: icon,
                  color: value.getBottomNaviFocus() == path
                      ? HexColor.fromHex("#064a89")
                      : HexColor.fromHex("#d7d7d7"),
                ))));
  }
}
