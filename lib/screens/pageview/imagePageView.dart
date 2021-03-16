import 'package:cached_network_image/cached_network_image.dart';
import 'package:doraemon/globalfunction.dart';
import 'package:flutter/material.dart';
import '../../models/dummy/imagePageViewDummy.dart';
import '../material/avatar.dart';

class ImagePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ImagePageViewContentDummy pageViewContentDummy =
        ImagePageViewContentDummy.fetchOne();

    return Scaffold(
      body: PageView.builder(
        itemCount: pageViewContentDummy.imagePages.length,
        itemBuilder: (context, position) {
          if (position == 0) {
            return Stack(
              children: [
                Container(
                  height: 1200,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        pageViewContentDummy.imagePages[position].imageUrl,
                    placeholder: (context, url) => Container(
                      child: Center(
                        child: new CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(
                    width: double.infinity,
                    height: 1200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.7)
                        ]))),
                Positioned(
                  bottom: 10,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Avatar(
                                  size: "small",
                                  imageUrl:
                                      pageViewContentDummy.authorInfo.profile,
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                      pageViewContentDummy.authorInfo.nickname,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    // width:double.infinity,
                                    child: Text(pageViewContentDummy.createdAt,
                                        style: TextStyle(color: Colors.grey),
                                        textAlign: TextAlign.left),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: double.infinity,
                          child: Text(pageViewContentDummy.title,
                              style: TextStyle(
                                  color: HexColor.fromHex("#ffffff"),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          // width: double.infinity,
                          child: Text(pageViewContentDummy.content,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              )),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("#태그",
                                      style: TextStyle(color: Colors.white))),
                                      Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("#태그",
                                      style: TextStyle(color: Colors.white))),
                                      Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("#태그",
                                      style: TextStyle(color: Colors.white))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: pageViewContentDummy.imagePages[position].imageUrl,
                placeholder: (context, url) => Container(
                  child: Center(
                    child: new CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          }
        },
      ),
    );
  }
}
