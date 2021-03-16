class Comment {

  final int id;
  final int boardId;
  final String content;
  final String author;
  final String topic;
  final int likeCount;
  final String createdAt;
  final bool isChildren;
  final int parentId;
  //authorInfo 추가예정
  Comment(this.id, this.boardId, this.content, this.author, this.topic, this.likeCount, this.createdAt, this.isChildren, this.parentId);
}