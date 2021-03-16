import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import '../frame//MainAppBar.dart';
import '../../globalfunction.dart';
import '../../models/board/board.dart';
import './boardDetail.dart';
import '../frame/mainAppBar.dart';
import '../material/basicSlideBanner.dart';
import '../material/basicGridMenu.dart';

class Boards extends StatelessWidget {
  const Boards({
    Key key,
    @required this.mainAppBar,
  }) : super(key: key);

  final MainAppBar mainAppBar;

  @override
  build(BuildContext context) {
    final boards = Board.fetchAll();

    return Column(
      children: [
        // mainAppBar,
        MainSlideBanner(),
        BasicGridMenu(),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
              itemCount: boards
                  .map((board) => Container(child: Text(board.title)))
                  .toList()
                  .length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              itemBuilder: (c, index) {
                Board board = boards[index];
                return BoardItem(board: board);
              }),
        )

        // ListView(
        //     children: boards.map((board)=>Container(child: Text(board.title))).toList(),
        // ),
      ],
    );
  }
}

class BoardItem extends StatelessWidget {
  const BoardItem({
    Key key,
    @required this.board,
  }) : super(key: key);

  final Board board;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BoardDetail())) 
      },
      child: Container(
        color: HexColor.fromHex("#ffffff"),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 60,
              child: 
              CachedNetworkImage(
                 fit:BoxFit.cover,
                imageUrl: board.thumbnail,
                placeholder: (context, url) => Container(
                  child: Center(child: new CircularProgressIndicator(),),
                ), 
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            ),
            Expanded(
              child: Column(
                children: [ 
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 15),
                      child: Text(board.title,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(height: 5),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 15),
                      child: Text(board.createAt,
                          style: TextStyle(fontSize: 12, color: Colors.grey)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
