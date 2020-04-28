import 'NetUtil.dart';
import 'ErrorHandler.dart';

/// 所有接口请求

class ApiInterface {

  static final String _API_GET_TEAM_FUND = '';
  static Future<Map<String, dynamic>> getTeamFund(
      LoginInvalidHandler handler) async {
    return NetUtil.getJson(_API_GET_TEAM_FUND, {})
        .catchError(handler.loginInvalidHandler);
  }
  ///登录
  static final String _API_LOGIN = 'authorizations';
  static Future<Map<String, dynamic>> loginRequest(
      String username, String password) async {
    return NetUtil.postJson(_API_LOGIN,
        {"username": username, "password": password});
  }
  ///检查登录状态，免登陆
  static final String _API_CHECK = 'check';
  static Future<Map<String, dynamic>> checkRequest() async {
    return NetUtil.postJson(_API_CHECK, {});
  }

  ///公司管理数据
  static final String _API_COMPANY = 'companies';
  static Future<Map<String, dynamic>> getCompanyData(
      LoginInvalidHandler handler) async {
    return NetUtil.getJson(_API_COMPANY, {})
        .catchError(handler.loginInvalidHandler);
  }
  ///通讯录
  static final String _API_ADDRESSBOOK = 'contacts';
  static Future<Map<String, dynamic>> getContactsData(
      LoginInvalidHandler handler) async {
    return NetUtil.getJson(_API_ADDRESSBOOK, {})
        .catchError(handler.loginInvalidHandler);
  }
}
