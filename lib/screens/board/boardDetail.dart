import 'package:doraemon/models/board/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../globalfunction.dart';
import '../../models/board/board.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BoardDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final boards = Board.fetchAll();
    final board = boards.first;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              board.title,
              style: TextStyle(fontSize: 17),
            ),
            backgroundColor: Colors.white,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.black,
                  displayColor: Colors.black,
                ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: CachedNetworkImage(
                    imageUrl: board.thumbnail,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      child: Center(
                        child: new CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: Html(
                          data: """${board.content} """,
                          onLinkTap: (String url) {
                            //open URL in webview, or launch URL in browser, or any other logic here
                          }),
                    )),
                // Text(board.authorInfo.nickname),

                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
                          width: double.infinity,
                          child: Text(
                            "Creator",
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        padding: EdgeInsets.all(15),
                        color: HexColor.fromHex("#ededed"),
                        child: Row(
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                child: CachedNetworkImage(
                                  imageUrl: board.authorInfo.profile,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    child: Center(
                                      child: new CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                )),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    width: double.infinity,
                                    child: Text(board.authorInfo.nickname,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 15),
                                      margin: EdgeInsets.only(top: 5),
                                      width: double.infinity,
                                      child: Text(board.authorInfo.about))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   padding: EdgeInsets.all(15),
                //   color: HexColor.fromHex("#ededed")
                //   child: Text("hakgu"),
                // ),
                Comments(board: board)
              ],
            ),
          )),
    );
  }

  List<Widget> textSections(Board board) {
    return board.comments
        .map((comment) => Container(
                child: Row(
              children: [Text(comment.content)],
            )))
        .toList();
  }
}

class Comments extends StatelessWidget {
  const Comments({
    Key key,
    @required this.board,
  }) : super(key: key);

  final Board board;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: board.comments
            .map((comment) => Container(child: Text(comment.content)))
            .toList()
            .length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
        itemBuilder: (c, index) {
          Comment comment = board.comments[index];
          // : Text(comment.content)
          //  Text(comment.createdAt)
          return Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              // padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Row(children: [
                Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://nationalminimumwage.co.za/wp-content/uploads/2015/04/default-user-icon-profile.png",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        child: Center(
                          child: new CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          child: Text(comment.author,
                              style: TextStyle(
                                  color: HexColor.fromHex("#4a4a4a"),
                                  fontWeight: FontWeight.bold))),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          width: double.infinity,
                          child: Text(comment.content)),
                      Container(
                          width: double.infinity,
                          child: Text(comment.createdAt,
                              style: TextStyle(
                                  color: HexColor.fromHex("#9a9a9a"),
                                  fontSize: 11)))
                    ],
                  ),
                )
              ]));
        });
  }
}
