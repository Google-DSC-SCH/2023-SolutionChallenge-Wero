//일기 등록(날짜별)
class Diary {
Diary({
required this.date,
required this.title,
required this.contents,
});
late final String date;
late final String title;
late final String contents;

Diary.fromJson(Map<String, dynamic> json){
date = json['date'];
title = json['title'];
contents = json['contents'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['date'] = date;
_data['title'] = title;
_data['contents'] = contents;
return _data;
}
}