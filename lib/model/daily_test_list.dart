
// 데일리 그래프 < > 버튼 및 최초 진입(/api/daily/paging?page=0&size=7) -> 1달치 /최근날짜 정렬 후 페이징 처리해서 7개씩 조회( < > 누를 때마다 +1, -1

class DailyTestList {
  DailyTestList({
    required this.dailyTestList,
  });
  late final List<DailyTest> dailyTestList;

  DailyTestList.fromJson(Map<String, dynamic> json){
    dailyTestList = List.from(json['dailyTestList']).map((e)=>DailyTest.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dailyTestList'] = dailyTestList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DailyTest {
  DailyTest({
    required this.dailyScore,
    required this.dailyDate,
    required this.dailyEmotion,
  });
  late final int dailyScore;
  late final String dailyDate;
  late final String dailyEmotion;

  DailyTest.fromJson(Map<String, dynamic> json){
    dailyScore = json['dailyScore'];
    dailyDate = json['dailyDate'];
    dailyEmotion = json['dailyEmotion'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dailyScore'] = dailyScore;
    _data['dailyDate'] = dailyDate;
    _data['dailyEmotion'] = dailyEmotion;
    return _data;
  }
}