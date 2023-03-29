//Access token 만료 후 갱신
class AccessReGen {
  AccessReGen({
    required this.message,
    required this.accessToken,
  });
  late final String message;
  late final String accessToken;

  AccessReGen.fromJson(Map<String, dynamic> json){
    message = json['message'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['accessToken'] = accessToken;
    return _data;
  }
}
