import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'globalfunction.dart';
import 'memo/index.dart';
import 'package:doraemon/providers/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
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
      home: ChangeNotifierProvider<Splash>(
          create: (context) => Splash(),
          child: SafeArea(
            child: MemoScaffold(),
            // child:  MainBody(),
          )),
    );
  }
}

class MainAppBar extends StatelessWidget {
  MainAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: HexColor.fromHex("#ffffff")),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            title,
          ],
        ));
  }
}

class GridMenuModel {
  String title;
  Icon menuIcon;
  String badgeText;
  Color badgeBackground;

  GridMenuModel(String title, Icon menuIcon, String badgeText, Color type) {
    this.title = title;
    this.menuIcon = menuIcon;
    this.badgeText = badgeText;
    this.badgeBackground = badgeBackground;
  }
}

List<GridMenuModel> gridMenus = [
  GridMenuModel("블랙", Icon(Icons.ac_unit), "프리미엄", Colors.red),
  GridMenuModel("모텔", Icon(Icons.ac_unit), "대실할인", Colors.blue),
  GridMenuModel("호텔", Icon(Icons.ac_unit), "", null),
  GridMenuModel("리조트", Icon(Icons.ac_unit), "프리미엄", null),
  GridMenuModel("펜션, 풀빌라", Icon(Icons.ac_unit), "대실할인", Colors.blue),
  GridMenuModel("캠핑, 글램핑", Icon(Icons.ac_unit), "", null),
  GridMenuModel("게하, 한옥", Icon(Icons.ac_unit), "프리미엄", null),
  GridMenuModel("액티비티", Icon(Icons.ac_unit), "대실할인", Colors.blue),
  GridMenuModel("테마 모텔", Icon(Icons.ac_unit), "", Colors.green),
  GridMenuModel("미친특가", Icon(Icons.ac_unit), "프리미엄", Colors.red),
  GridMenuModel("겨울호캉스", Icon(Icons.ac_unit), "대실할인", null),
  GridMenuModel("호텔빈방모음", Icon(Icons.ac_unit), "", null),
];

class MainScaffold extends StatelessWidget {
  List<String> bannerList = [
    "https://img.insight.co.kr/static/2018/10/08/700/9k7128gqt7t0ee1kxia7.jpg",
    "https://dailygrid.net/news/photo/201911/312526_211061_5533.png"
  ];

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top;
    var mainAppBar = MainAppBar(
      title: Text('저기어때',
          style: TextStyle(
              fontSize: 20,
              color: HexColor.fromHex("#ff5349"),
              fontWeight: FontWeight.w900)),
    );
    return Material(
        child: Column(
      children: <Widget>[
        LimitedBox(
            maxHeight: paddingTop,
            child: AppBar(
              brightness: Brightness.dark,
            )),
        Expanded(
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  mainAppBar,
                  Column(
                    children: [
                      MainSlideBanner(),
                    ],
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                        itemCount: gridMenus.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 16,
                            childAspectRatio: 1,
                            mainAxisSpacing: 16),
                        itemBuilder: (c, index) {
                          GridMenuModel gridMenuModel =
                              gridMenus.elementAt(index);
                          return GridBadgeMenuItem(
                              gridMenuModel: gridMenuModel);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  CarouselSlider MainSlideBanner() {
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
}

class GridBadgeMenuItem extends StatelessWidget {
  final GridMenuModel gridMenuModel;
  const GridBadgeMenuItem({
    Key key,
    @required this.gridMenuModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpeechBubble(gridMenuModel: gridMenuModel),
            Text(gridMenuModel.title),
            gridMenuModel.menuIcon,
          ],
        ));
  }
}

class SpeechBubble extends StatelessWidget {
  const SpeechBubble({
    Key key,
    @required this.gridMenuModel,
  }) : super(key: key);
  final GridMenuModel gridMenuModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            gridMenuModel.title,
            textScaleFactor: 1.0,
            style: TextStyle(
              fontFamily: '',
              fontSize: 14,
              color: Colors.white,
            ),
          ),
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
