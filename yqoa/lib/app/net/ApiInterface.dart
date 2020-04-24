import 'NetUtil.dart';
import 'common_error_handler_utils.dart';
import 'API.dart';

/// 所有接口请求

class ApiInterface {
  static final String _API_GET = "user/";

  static Future<Map<String, dynamic>> getSmsCode(
      String flag, String phoneNum, String vefifyCode) async {
    return NetUtil.postJson(_API_GET,
        {"flagId": flag, "phone": phoneNum, "vefifyCode": vefifyCode});
  }


  static final String _API_GET_TEAM_FUND = '';
  static Future<Map<String, dynamic>> getTeamFund(
      LoginInvalidHandler handler) async {
    return NetUtil.getJson(_API_GET_TEAM_FUND, {})
        .catchError(handler.loginInvalidHandler);
  }

  static Future<Map<String, dynamic>> loginRequest(
      String username, String password) async {
    return NetUtil.postJson(API.loginUrl,
        {"username": username, "password": password});
  }
}
