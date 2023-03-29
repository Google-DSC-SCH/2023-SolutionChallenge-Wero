//로그인 완료

class LoginEnded {
  LoginEnded({
    required this.accessToken,
    required this.refreshToken,
  });

  late final String accessToken;
  late final String refreshToken;

  LoginEnded.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accessToken'] = accessToken;
    _data['refreshToken'] = refreshToken;
    return _data;
  }
}
