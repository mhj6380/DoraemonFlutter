import 'package:doraemon/providers/splash.dart';
import 'package:flutter/material.dart';
import '../globalfunction.dart';
import 'package:provider/provider.dart';
import '../auth/LoginPage.dart';
 
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

class MemoScaffold extends StatelessWidget {
  final bool isLoggedIn = false;
 
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
 
 
    if(!isLoggedIn){
     return LoginPage();
    }else{ 
    return ChangeNotifierProvider<Splash>(
        create: (context) => Splash(),
        child: Scaffold(
        body:  SingleChildScrollView( 
          child: Consumer<Splash>(
            builder: (context, value, child){  
              return IndexedStack(index:value.getBottomNaviFocus(), children: [HomePage(mainAppBar:mainAppBar), ContentPage(mainAppBar:mainAppBar), MyPage(mainAppBar:mainAppBar)],);
            }
          ),
        ), 
      bottomNavigationBar:  BasicBottomNavigationBar(), 
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
            mainAppBar,
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
            mainAppBar,
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




class MyPage extends StatelessWidget {
  const MyPage({
    Key key,
    @required this.mainAppBar, 
  }) : super(key: key);

  final MainAppBar mainAppBar;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            mainAppBar,
               Container(
              height: 300,
              color: Colors.amber, 
            ),
            Container(
              height: 300,
              color: Colors.green,
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
  Widget build(BuildContext context){
    return (
      Container(
        height:50,
        color: HexColor.fromHex("#ffffff"),
        child: Row( 
          children: [
            // value.getBottomNaviFocus().toString()
            BottomNavigationItem(path:0, icon:Icon(Icons.add)),
            BottomNavigationItem(path:1, icon:Icon(Icons.add)),  
            BottomNavigationItem(path:2, icon:Icon(Icons.add)),  
          ],  
        ),  
      ) 
    );
  }
}

class BottomNavigationItem extends StatelessWidget { 

  final int path;
  final Widget icon;

  const BottomNavigationItem({
    Key key, 
    this.path,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Consumer<Splash>(builder: (context, value, child) => Center(
      child: IconButton(onPressed: () => Provider.of<Splash>(context, listen: false).changeBottomNaiveFocus(path), icon: icon, 
      color: value.getBottomNaviFocus() == path ? HexColor.fromHex("#064a89") : HexColor.fromHex("#d7d7d7"),
      ))) 
      );  
  }
}
