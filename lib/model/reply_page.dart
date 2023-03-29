class ReplyInfoResDtoList {
  ReplyInfoResDtoList({
    required this.replyInfoResDtoList,
  });
  late final List<ReplyInfoResDto> replyInfoResDtoList;

  ReplyInfoResDtoList.fromJson(Map<String, dynamic> json){
    replyInfoResDtoList = List.from(json['replyInfoResDto']).map((e)=>ReplyInfoResDto.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['replyInfoResDto'] = replyInfoResDtoList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ReplyInfoResDto {
  ReplyInfoResDto({
    required this.email,
    required this.nickname,
    required this.mbti,
    required this.replyId,
    required this.contents,
  });
  late final String email;
  late final String nickname;
  late final String mbti;
  late final int replyId;
  late final String contents;

  ReplyInfoResDto.fromJson(Map<String, dynamic> json){
    email = json['email'];
    nickname = json['nickname'];
    mbti = json['mbti'];
    replyId = json['replyId'];
    contents = json['contents'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['nickname'] = nickname;
    _data['mbti'] = mbti;
    _data['replyId'] = replyId;
    _data['contents'] = contents;
    return _data;
  }
}