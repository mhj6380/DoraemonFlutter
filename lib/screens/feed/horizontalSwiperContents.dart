import 'package:cached_network_image/cached_network_image.dart';
import 'package:doraemon/globalfunction.dart';
import 'package:flutter/material.dart';
import '../../models/dummy/feedDummy.dart';
import '../pageview/imagePageView.dart';

class HorizontalSwiperContents extends StatelessWidget {
  const HorizontalSwiperContents({
    Key key,
    @required this.feedTitle,
  }) : super(key: key);
  final String feedTitle;

  @override
  Widget build(BuildContext context) {
    List<FeedDummy> feeds = FeedDummy.fetchAll();

    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
          padding: EdgeInsets.only(left: 15),
          child: Text(
            feedTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
          margin: EdgeInsets.symmetric(vertical: 20.0),
          // 컨테이너의 높이를 200으로 설정
          height: 270.0,
          // 리스트뷰 추가
          child: ListView.builder(
              itemCount: feeds.toList().length,
              // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
              scrollDirection: Axis.horizontal,
              // 컨테이너들을 ListView의 자식들로 추가
              itemBuilder: (c, index) {
                final item = feeds[index];
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImagePageView()))
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 160,
                    height: 500,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new CachedNetworkImageProvider(
                                      item.thumbnail),
                                ),
                              ),
                            ),
                            Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.1),
                                          Colors.black.withOpacity(0.6)
                                        ]))),
                            Positioned(
                              bottom: 10,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Text("오늘 오후 10:00",
                                    style: TextStyle(
                                        color: HexColor.fromHex("#ffffff"))),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.black.withOpacity(0.6)),
                                // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(1))),
                                child: Text("NEXT UP",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor.fromHex("#ffffff"))),
                              ),
                            )
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(item.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
