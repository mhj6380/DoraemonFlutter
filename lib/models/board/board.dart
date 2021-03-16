import 'comment.dart';
import '../user/user.dart';

class Board {
  int id;
  String topic;
  String title;
  String content;
  String thumbnail;
  int likeCount;
  int scrapCount;
  int shareCount;
  int viewCount;
  int commentCount;
  String createAt;
  final User authorInfo;
   //authorInfo 추가예정
  final List<Comment> comments;

  Board(this.id, this.topic, this.title, this.content, this.thumbnail, this.likeCount, this.scrapCount, this.shareCount, this.viewCount, this.commentCount, this.createAt, this.comments, this.authorInfo);

  static List<Board> fetchAll(){
    return [
      Board(1, 'default', '테스트 게시물 1', '<p style="text-align: center;" align="center"><span style="font-size: 14pt;">안녕하세요 학구입니다.</span></p><p style="text-align: center; " align="center"><span style="font-size: 14pt;">커뮤니티 앱을 만들고 있는데</span></p><p style="text-align: center; " align="center"><span style="font-size: 14pt;">콘텐츠의 내용 샘플이 필요해서</span></p><p style="text-align: center; " align="center"><br></p><p style="text-align: center; " align="center"><span style="font-size: 14pt;">어디한번 만들어보겠습니다.</span></p><p style="text-align: center; " align="center"><br></p><p style="text-align: center; " align="center"><span style="font-size: 14pt;"><b>1. 샘플이 잘 노출되고 있는지</b></span></p><p style="text-align: center; " align="center"><br></p><p style="text-align: center; " align="center"><font color="#ffffff"><span style="font-size: 14pt; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">HTML이 잘 노출되고 있는지</span></font></p><p style="text-align: center; " align="center"><font color="#ffffff"><span style="font-size: 14pt; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">확인 해보겠습니다.</span></font></p><p style="text-align: center; " align="center"><br></p><p style="text-align: center; " align="center"><font color="#ffffff"><span style="font-size: 14pt; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);"><b>2. 하이퍼 링크 테스트</b></span></font></p><p style="text-align: center; " align="center"><font color="#ffffff"><span style="font-size: 11pt; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);"><br></span></font></p><p style="text-align: center; " align="center"><font color="#ffffff"><span style="font-size: 14pt; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">아래의 링크를 클릭해보세요.</span></font></p><p style="text-align: center; " align="center"><font color="#ffffff"><span style="font-size: 14pt; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">아마도 아직은 작동하지 않을 수 있습니다.</span></font></p><p style="text-align: center; " align="center"><font color="#ffffff"><span style="font-size: 11pt; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);"><br></span></font></p><p style="text-align: center; " align="center"><font color="#ffffff"><span style="font-size: 14pt; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);"><a href="https://www.naver.com" target="_self">테스트 링크</a></span></font></p><p style="text-align: center; " align="center"><br></p><p style="text-align: center; " align="center"><img alt="Google" src="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png" /><br style="clear:both;"><br></p><p style="text-align: center; " align="center"><br></p><p style="text-align: center; " align="center"><span style="font-size: 11pt; background-color: rgb(0, 0, 0); color: rgb(255, 255, 255);"><br></span></p>', 'https://cdn.pixabay.com/photo/2017/03/25/18/06/color-2174066__340.png', 1,2,3,4,5,'2020-10-28 10:20:00',[
        Comment(1, 1, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,1),
        Comment(2, 2, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,2),
      ], User(1,"test@gmail.com","학구", "https://cdn.pixabay.com/photo/2017/03/25/18/06/color-2174065__340.png","안녕하세요 학구입니다 :)")), 
      Board(2, 'default', '테스트 게시물 2', '게시물의 내용 샘플입니다 :)', 'https://cdn.pixabay.com/photo/2017/03/25/18/06/color-2174065__340.png', 1,2,3,4,5,'2020-10-28 10:20:00',[
        Comment(1, 1, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,1),
        Comment(2, 2, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,2),
      ],User(1,"test@gmail.com","학구", "https://cdn.pixabay.com/photo/2017/05/19/11/56/color-2326315__340.jpg","안녕하세요 학구입니다 :)")),
      Board(3, 'default', '테스트 게시물 3', '게시물의 내용 샘플입니다 :)', 'https://cdn.pixabay.com/photo/2017/05/19/11/56/color-2326315__340.jpg', 1,2,3,4,5,'2020-10-28 10:20:00',[
        Comment(1, 1, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,1),
        Comment(2, 2, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,2),
      ],User(1,"test@gmail.com","학구", "https://cdn.pixabay.com/photo/2014/12/01/20/14/spectrum-553216__340.jpg","안녕하세요 학구입니다 :)")),
      Board(4, 'default', '테스트 게시물 4', '게시물의 내용 샘플입니다 :)', 'https://cdn.pixabay.com/photo/2014/12/01/20/14/spectrum-553216__340.jpg', 1,2,3,4,5,'2020-10-28 10:20:00',[
        Comment(1, 1, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,1),
        Comment(2, 2, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,2),
      ],User(1,"test@gmail.com","학구", "https://www.ui4u.go.kr/depart/img/content/sub03/img_con03030100_01.jpg","안녕하세요 학구입니다 :)")),
      Board(5, 'default', '테스트 게시물 5', '게시물의 내용 샘플입니다 :)', 'https://cdn.pixabay.com/photo/2016/12/18/21/51/bokeh-1916807__340.jpg', 1,2,3,4,5,'2020-10-28 10:20:00',[
        Comment(1, 1, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,1),
        Comment(2, 2, '댓글입니다!', 'hakgu@gmail.com', 'default', 10, '2020-10-28 10:20:00', false,2),
      ],User(1,"test@gmail.com","학구", "https://www.ui4u.go.kr/depart/img/content/sub03/img_con03030100_01.jpg","안녕하세요 학구입니다 :)")),
    ];
  }
}  