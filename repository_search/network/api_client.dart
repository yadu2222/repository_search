import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/models/req_model.dart';
import '../core/constans/api_endpoints.dart';

class HttpReq {
  static Future<Map> httpReq(Request reqData, [bool isAuth = true]) async {
    String url = ApiEndpoints.baseUrl + reqData.url; // urlを生成
    // パラメータがあればurlと合成
    if (reqData.pasParams != null) {
      url += "/${reqData.pasParams}";
    }

    Uri uri = Uri.parse(url);

    // クエリパラメータの処理
    if (reqData.queryParams != null) {
      uri = uri.replace(queryParameters: reqData.queryParams);
    }

    http.Response response = http.Response('{}', 500); // 初期値を設定（例: 空のレスポンス）;
    // リクエストの種類によって処理を分岐
    switch (reqData.reqType) {
      case 'GET':
        response = await http.get(
          uri,
          headers: reqData.headers,
        );
        break;
    }
    // レスポンスの処理
    debugPrint(response.body.toString());
    // 成功
    if (response.statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
      // 失敗時の処理
    } else {
      return reqData.errorHandling(response);
    }
  }
}
