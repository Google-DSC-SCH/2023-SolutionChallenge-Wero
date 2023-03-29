//게시판 페이지 진입(조회)(/api/board)
//List<boardInfo> boardMainResList = new List<>(); =====> 해야됨
class BoardInfoList {
  BoardInfoList({
    required this.boardInfoList,
  });
  late final List<BoardInfo> boardInfoList;

  BoardInfoList.fromJson(Map<String, dynamic> json){
    boardInfoList = List.from(json['boardInfoList']).map((e)=>BoardInfo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['boardInfoList'] = boardInfoList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class BoardInfo {
  BoardInfo({
    required this.email,
    required this.nickname,
    required this.mbti,
    required this.boardId,
    required this.title,
    required this.contents,
  });
  late final String email;
  late final String nickname;
  late final String mbti;
  late final int boardId;
  late final String title;
  late final String contents;

  BoardInfo.fromJson(Map<String, dynamic> json){
    email = json['email'];
    nickname = json['nickname'];
    mbti = json['mbti'];
    boardId = json['boardId'];
    title = json['title'];
    contents = json['contents'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['nickname'] = nickname;
    _data['mbti'] = mbti;
    _data['boardId'] = boardId;
    _data['title'] = title;
    _data['contents'] = contents;
    return _data;
  }
}
