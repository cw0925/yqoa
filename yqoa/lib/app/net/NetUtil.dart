import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetUtil {
  static final debug = true;
  static BuildContext context = null;

  static final host = 'http://ivy.dp.youqii.com';
  static final baseUrl = host + '/api/';

  // ignore: argument_type_not_assignable
  static final Dio _dio = new Dio(new BaseOptions(
      method: "get",
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true));

  /// 代理设置，方便抓包来进行接口调节
//  static void setProxy() {
//    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
//      // config the http client
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return "PROXY localhost:8888";
//      };
//      // you can also create a new HttpClient to dio
//      // return new HttpClient();
//    };
//  }

  static String token;

  static final LogicError unknowError = LogicError(-1, "未知异常");

  static Future<Map<String, dynamic>> getJson<T>(
      String uri, Map<String, dynamic> paras) =>
      _httpJson("get", uri, data: paras).then(logicalErrorTransform);

  static Future<Map<String, dynamic>> getForm<T>(
      String uri, Map<String, dynamic> paras) =>
      _httpJson("get", uri, data: paras, dataIsJson: false)
          .then(logicalErrorTransform);

  /// 表单方式的post
  static Future<Map<String, dynamic>> postForm<T>(
      String uri, Map<String, dynamic> paras) =>
      _httpJson("post", uri, data: paras, dataIsJson: false)
          .then(logicalErrorTransform);

  /// requestBody (json格式参数) 方式的 post
  static Future<Map<String, dynamic>> postJson(
      String uri, Map<String, dynamic> body) =>
      _httpJson("post", uri, data: body).then(logicalErrorTransform);

  static Future<Map<String, dynamic>> deleteJson<T>(
      String uri, Map<String, dynamic> body) =>
      _httpJson("delete", uri, data: body).then(logicalErrorTransform);

  /// requestBody (json格式参数) 方式的 put
  static Future<Map<String, dynamic>> putJson<T>(
      String uri, Map<String, dynamic> body) =>
      _httpJson("put", uri, data: body).then(logicalErrorTransform);

  /// 表单方式的 put
  static Future<Map<String, dynamic>> putForm<T>(
      String uri, Map<String, dynamic> body) =>
      _httpJson("put", uri, data: body, dataIsJson: false)
          .then(logicalErrorTransform);

  /// 文件上传  返回json数据为字符串
  static Future<T> putFile<T>(String uri, String filePath) async {
    var name = filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
//    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
//    FormData formData = new FormData.from({
//      "multipartFile": new UploadFileInfo(new File(filePath), name,
//          contentType: ContentType.parse("image/$suffix"))
//    });
    FormData formData = FormData.fromMap({
      "multipartFile": await MultipartFile.fromFile(filePath, filename: name),
    });
    token = getToken();
    var enToken = token == null ? "" : Uri.encodeFull(token);
    return _dio
        .put<Map<String, dynamic>>("$uri?token=$enToken", data: formData)
        .then(logicalErrorTransform);
  }


  static Future<Response<Map<String, dynamic>>> _httpJson(
      String method, String uri,
      {Map<String, dynamic> data, bool dataIsJson = true}) async{
    ///获取token
    token = await getToken();
    var enToken = token == null ? "" : Uri.encodeFull(token);
    /// 如果为 get方法，则进行参数拼接
    if (method == "get") {
      dataIsJson = false;
      if (data == null) {
        data = new Map<String, dynamic>();
      }
//      data["token"] = token;
    }
    if (debug) {
      print('<net url>------$uri');
      print('<net params>------$data');
    }
    /// 根据当前 请求的类型来设置 如果是请求体形式则使用json格式
    /// 否则则是表单形式的（拼接在url上）
    Options op;
    if (dataIsJson) {
      op = new Options(contentType: Headers.jsonContentType);
    } else {
      op = new Options(contentType: Headers.formUrlEncodedContentType);
    }
    op.method = method;
    op.headers["authorization"] = token;
    print('<token>------$enToken');
    /// 统一带上token
    return _dio.request<Map<String, dynamic>>(
        method == "get" ? uri : "$uri?token=$enToken",
        data: data,
        options: op);
  }

  /// 对请求返回的数据进行统一的处理
  /// 如果成功则将我们需要的数据返回出去，否则进异常处理方法，返回异常信息
  static Future<T> logicalErrorTransform<T>(Response<Map<String, dynamic>> resp) {

    if (debug) {
//      print('resp--------$resp');
//      print('resp.headers--------${resp.headers['authorization']}');
      print('resp.data--------${resp.data}');
    }
    if(resp.headers['authorization'] != null){
      String authorization = resp.headers['authorization'][0];
      saveToken(authorization);
    }

    if (resp.data != null) {
      if (resp.data["errcode"] == 0||resp.data["code"] == 0) {
        T realData = resp.data as T;
        return Future.value(realData);
      }
    }

    LogicError error;
//    if (resp.data != null && resp.data["errcode"] == 0) {
//      if (resp.data['data'] != null) {
//        /// 失败时  错误提示在 data中时
//        /// 收到token过期时  直接进入登录页面
//        Map<String, dynamic> realData = resp.data["data"];
//        error = new LogicError(resp.data["code"], realData['codeMessage']);
//      } else {
//        /// 失败时  错误提示在 message中时
//        error = new LogicError(resp.data["code"], resp.data["message"]);
//      }
//
//      /// token失效 重新登录  后端定义的code码
//      if (resp.data["code"] == 10000000) {
////        NavigatorUtils.goPwdLogin(context);
//
//      }
//      if(resp.data["code"] == 80000000){
//        //操作逻辑
//      }
//    } else {
//      error = unknowError;
//    }
    if (resp.data["errcode"] != 0||resp.data["code"] != 0) {
      /// token失效 重新登录  后端定义的code码
      if (resp.data["errcode"] == 10401) {
//        NavigatorUtils.goPwdLogin(context);
//        print('token失效 重新登录----${resp.data["errcode"]}');
//        Navigator.pushNamed(context,"/app");
      }else{
        error = new LogicError(resp.data["errcode"], resp.data["errmsg"]);
      }
    }else {
      error = unknowError;
    }
    return Future.error(error);
  }
//  保存token
  static saveToken(value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", value);
  }
//  获取token
  static getToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}

class LogicError {
  int errorCode;
  String msg;

  LogicError(errorCode, msg) {
    this.errorCode = errorCode;
    this.msg = msg;
  }
}

enum PostType { json, form, file }
