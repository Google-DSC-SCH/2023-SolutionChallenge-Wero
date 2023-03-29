//게시판 등록(/api/board), 수정
class Post {
Post({
required this.title,
required this.contents,
this.img,
});
late final String title;
late final String contents;
late final Null img;

Post.fromJson(Map<String, dynamic> json){
title = json['title'];
contents = json['contents'];
img = null;
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['title'] = title;
_data['contents'] = contents;
_data['img'] = img;
return _data;
}
}