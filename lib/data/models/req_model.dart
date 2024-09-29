import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// デフォルトのエラーハンドリング関数
Map<String, dynamic> defaultErrorHandling(http.Response response) {
  if (response.statusCode == 401) {
    debugPrint('Error response: ${response.body}');
    return {'error': 'Request failed', 'status': response.statusCode, 'body': response.body};
  }
  return {'error': 'Request failed', 'status': response.statusCode, 'body': response.body};
}

class Request {
  String reqType; // 'GET', 'POST', 'PUT', 'DELETE'
  String url; // base URLを除いたリクエスト先のURL
  Map<String, String> headers; // ヘッダー (Authorizationは除く)
  Map<String, dynamic>? body; // ボディ
  Function(http.Response) errorHandling; // エラーハンドリング関数 失敗時の処理
  String? pasParams;
  Map<String, String>? queryParams;
  Request({required this.reqType, required this.url, this.headers = const {}, this.body, this.errorHandling = defaultErrorHandling, this.pasParams,this.queryParams});
}
