import 'dart:convert';
import 'package:http/http.dart' as http;
class APIResponse{
  var data;
  bool ok;
  int statusCode;
  var message;
  bool okAndContainsData;
  ResponseErrors errors;
  APIResponse({this.data, this.ok, this.message, this.okAndContainsData, this.statusCode, this.errors});

  factory APIResponse.fromResponse(http.Response response,) {
    var parsedJson = jsonDecode(response.body);
    return APIResponse(
      statusCode: response.statusCode,
      ok: (response.statusCode == 200 || response.statusCode == 201),
      data: parsedJson['data'] != null ? parsedJson['data'] : null,
      okAndContainsData: (response.statusCode == 200 ||
          response.statusCode == 201) && (parsedJson['data'] != null),
      message: parsedJson['message'] != null ? parsedJson['message'] : "",
      errors: parsedJson['errors'] != null
          ? parsedJson['errors'].runtimeType == String
          ? new ResponseErrors(message: parsedJson['errors'])
          : ResponseErrors.fromJson(parsedJson['errors'])
          : parsedJson['error'] != null ? ResponseErrors(
          message: parsedJson['error']) : null,
    );
  }
}
  class ResponseErrors {
  String message;

  ResponseErrors({
  this.message,
  });

  factory ResponseErrors.fromJson(Map<String, dynamic> parsedJson) {
  return ResponseErrors(
  message: parsedJson['message'] != null ? parsedJson['message'] : "",
  );
  }
  }