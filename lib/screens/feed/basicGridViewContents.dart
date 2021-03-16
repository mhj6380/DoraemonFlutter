import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/dummy/feedDummy.dart';

class BasicGridViewContents extends StatelessWidget {
  const BasicGridViewContents({
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
          margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
          padding: EdgeInsets.only(left: 15),
          child: Text(
            feedTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
              itemCount: feeds.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(7),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  childAspectRatio: 1,
                  mainAxisSpacing: 7),
              itemBuilder: (c, index) {
                FeedDummy item = feeds[index];
                return Container(
                  height: 1000,
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                new CachedNetworkImageProvider(item.thumbnail),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
