class FeedDummy {
  int id;
  String title;
  String thumbnail;
 
  FeedDummy(this.id,this.title, this.thumbnail);

  static List<FeedDummy> fetchAll(){
    return [
        FeedDummy(1,"[학구단독]더미데이터 입니다.","https://cdn.pixabay.com/photo/2020/11/26/15/28/woman-5779323__340.jpg"),
        FeedDummy(2,"더미데이터 입니다 만약에 타이틀이 길경우엔 어떻게 처리할지 제목이 긴 콘텐츠도 추가해봅시다","https://cdn.pixabay.com/photo/2021/03/07/16/31/person-6076771__340.jpg"),
        FeedDummy(3,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/02/08/12/40/lasagna-5994612__340.jpg"),
        FeedDummy(4,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/02/08/16/03/dinosaur-5995333__340.png"),
        FeedDummy(5,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/01/24/20/21/cloud-5946381__340.jpg"), 
        FeedDummy(6,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/01/05/06/40/boat-5889919_960_720.png"),
        FeedDummy(7,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/03/02/15/01/bird-6062768__340.jpg"),
        FeedDummy(8,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/03/04/19/50/tea-6069409__340.jpg"),
        FeedDummy(9,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/03/03/20/31/theater-6066228__340.jpg"),
        FeedDummy(10,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/03/07/08/44/bee-6075541__340.jpg"),
        FeedDummy(11,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/02/15/08/35/breakwater-6017041__340.jpg"),
        FeedDummy(12,"더미데이터 입니다.","https://cdn.pixabay.com/photo/2021/02/12/09/36/sunflowers-6007847__340.jpg")
      ];
  }
}  