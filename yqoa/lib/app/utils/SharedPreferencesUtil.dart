import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil{
  /// 保存数据
  //Int
  Future setIntInfo(key, value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
  }
  //String
  Future setStringInfo(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }
  //Bool
  Future setBoolInfo(key, value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }
  //List
  Future setListInfo(key, value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList(key, value);
  }
  /// 获取数据
  Future getInfo(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    print(sp.get(key));
    return sp.get(key);
  }
  //String
  Future getStringInfo(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
//    print(sp.getString(key));
    return sp.getString(key);
  }
  /// 清除数据
  Future deleteInfo(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

}