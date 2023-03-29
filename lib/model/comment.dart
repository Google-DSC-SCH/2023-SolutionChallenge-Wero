//댓글 등록(/api/reply/{boardId}), 수정
class Comment {
  Comment({
    required this.contents,
  });

  late final String contents;

  Comment.fromJson(Map<String, dynamic> json) {
    contents = json['contents'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contents'] = contents;
    return _data;
  }
}
