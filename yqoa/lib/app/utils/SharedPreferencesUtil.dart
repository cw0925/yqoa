import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil{
  // 保存数据
  setStringInfo(key, value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  // 获取数据
  Future getStringInfo(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  // 清除数据
  Future deleteInfo(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

}