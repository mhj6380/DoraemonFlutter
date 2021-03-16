import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../globalfunction.dart';
import '../frame/mainAppBar.dart';
import '../../auth/LoginPage.dart';

class Mypage extends StatelessWidget {
  const Mypage({
    Key key,
    @required this.mainAppBar,
  }) : super(key: key);

  final MainAppBar mainAppBar;

  @override
  build(BuildContext context) { 
    return NotAuthenticationPage();
  }
}

class NotAuthenticationPage extends StatelessWidget {
  const NotAuthenticationPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0,100,0,0),
          child: CachedNetworkImage(
                height: 100,
                // fit:BoxFit.cover,
                width: double.infinity,
                imageUrl: "https://static.wikia.nocookie.net/caramella-girls/images/9/99/Blankpfp.png/revision/latest?cb=20190122015011",
                placeholder: (context, url) => Container(
                  child: Center(child: new CircularProgressIndicator(),),
                ), 
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
        ),

        Container(
          margin: EdgeInsets.only(top:20),
          width:double.infinity,
          child: Center(child: Text("로그인을 하시면 \n다양한 기능을 사용할 수 있습니다.", textAlign: TextAlign.center, style:TextStyle(color: HexColor.fromHex("#9a9a9a")))),
        ),
        GestureDetector(
          onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage())) 
      },
          child: Container(
            width: double.infinity,
            padding:EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
            color: Theme.of(context).primaryColor,
            child: Text("로그인", textAlign: TextAlign.center, style:TextStyle(color: HexColor.fromHex("#ffffff"))),
          ),
        )
      ],
    );
  }
} 