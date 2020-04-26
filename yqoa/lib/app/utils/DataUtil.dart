import 'SharedPreferencesUtil.dart';
class DataUtil{
  // 保存数据
  String getToken(){
    SharedPreferencesUtil sp = new SharedPreferencesUtil();
    var token = "";
    sp.getStringInfo("key").then((res){
      token = res;
    }).catchError((err){});
    return token;
  }

}