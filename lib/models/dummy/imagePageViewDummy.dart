import '../user/user.dart';

class ImagePageViewContentDummy {
  int id;
  User authorInfo;
  String thumbnail;
  String title;
  String content;
  String tags;
  int viewCount;
  int commentCount;
  int likeCount;
  int shareCount;
  String createdAt;
  List<ImagePage> imagePages;

  ImagePageViewContentDummy(
      this.id,
      this.authorInfo,
      this.thumbnail,
      this.title,
      this.content,
      this.tags,
      this.viewCount,
      this.commentCount,
      this.likeCount,
      this.shareCount,
      this.createdAt,
      this.imagePages);

  static ImagePageViewContentDummy fetchOne() {
    return ImagePageViewContentDummy(
        1,
        User(1, "test@gmail.com", "불꽃남자문학주",
            "https://playmango.kr/asset/playmango_logo.png", "안녕하세요 학구입니다"),
        "https://cdn.pixabay.com/photo/2015/03/26/09/59/purple-690724__340.jpg",
        "잠이 오지 않는 밤, 재워드릴게요",
        "주 2회 자정 당신의 밤을 함께 할 새벽감성 라디오\nVoice Mail(*-_-*)",
        "뻐끔ㅇ3ㅇ|라디오|라디오방송|새벽감성|Voice_Mail|학구",
        1031,
        152,
        568, 
        112,
        '2020-10-28 18:30:00',
        [
          
            ImagePage(0, "image",
              "https://cdnb.pikicast.com/550/2020/10/22/550_30983684_1603345391.webp"),
          ImagePage(1, "image",
              "https://cdnb.pikicast.com/550/2020/10/22/550_30983740_1603346380.webp"),
          ImagePage(2, "image",
              "https://cdnb.pikicast.com/550/2020/10/22/550_30983684_1603345391.webp"),
          ImagePage(3, "image",
              "https://cdnb.pikicast.com/550/2020/10/22/550_30983736_1603346347.webp"),
          ImagePage(4, "image",
              "https://cdnb.pikicast.com/550/2020/10/22/550_30983744_1603346404.webp"),
          ImagePage(5, "image",
              "https://cdnb.pikicast.com/550/2020/10/22/550_30983748_1603346407.webp")
        ]);
  }
}

class ImagePage {
  int id;
  String type;
  String imageUrl;

  ImagePage(this.id, this.type, this.imageUrl);
}
