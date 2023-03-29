//개인정보 입력 후 저장(/api/user/info)
class User {
  User({
    required this.nickname,
    required this.age,
    required this.sex,
  });
  late final String nickname;
  late final int age;
  late final String sex;

  User.fromJson(Map<String, dynamic> json){
    nickname = json['nickname'];
    age = json['age'];
    sex = json['sex'];
  }

  //데이터를 보낼때 json을 사용하기 위해 사용
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nickname'] = nickname;
    _data['age'] = age;
    _data['sex'] = sex;
    return _data;
  }
}