// response 에러 메세지(통일)
class ErrorMessage {
  ErrorMessage({
    required this.date,
    required this.request,
    required this.errorCode,
    required this.message,
  });

  late final int date;
  late final String request;
  late final String errorCode;
  late final String message;

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    request = json['request'];
    errorCode = json['errorCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['request'] = request;
    _data['errorCode'] = errorCode;
    _data['message'] = message;
    return _data;
  }
}
