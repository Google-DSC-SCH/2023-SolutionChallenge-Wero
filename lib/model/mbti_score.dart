//MBTI 검사 등록(/api/mbti/test)
class MBTIScore {
  MBTIScore({
    required this.mbti,
    required this.mScore,
    required this.bScore,
    required this.tScore,
    required this.iScore,
  });
  late final String mbti;
  late final int mScore;
  late final int bScore;
  late final int tScore;
  late final int iScore;

  MBTIScore.fromJson(Map<String, dynamic> json){
    mbti = json['mbti'];
    mScore = json['m_score'];
    bScore = json['b_score'];
    tScore = json['t_score'];
    iScore = json['i_score'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mbti'] = mbti;
    _data['m_score'] = mScore;
    _data['b_score'] = bScore;
    _data['t_score'] = tScore;
    _data['i_score'] = iScore;
    return _data;
  }
}