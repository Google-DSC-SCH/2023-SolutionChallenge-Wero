// 데일리 그래프 < > 버튼 및 최초 진입(/api/daily/paging?page=0&size=7) -> 1달치 /최근날짜 정렬 후 페이징 처리해서 7개씩
// -> 쿼리스트링으로
//
// 데일리 점수 저장(/api/daily/test)

class DailyData {
  DailyData({
    required this.dailyScore,
    required this.dailyDate,
    required this.dailyEmotion,
  });
  late final int dailyScore;
  late final String dailyDate;
  late final String dailyEmotion;

  DailyData.fromJson(Map<String, dynamic> json){
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