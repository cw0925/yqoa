import 'package:yqoa/generated/json/base/json_convert_content.dart';
import 'package:yqoa/generated/json/base/json_filed.dart';

class CompanyEntity with JsonConvert<CompanyEntity> {
	int errcode;
	String errmsg;
	int pages;
	List<CompanyData> data;
}

class CompanyData with JsonConvert<CompanyData> {
	int id;
	String name;
	String ename;
	String address;
	@JSONField(name: "zip_code")
	String zipCode;
	String tel;
	dynamic fax;
	dynamic website;
	dynamic wechat;
	@JSONField(name: "is_delete")
	int isDelete;
	int uid;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	CompanyDataUser user;
}

class CompanyDataUser with JsonConvert<CompanyDataUser> {
	int uid;
	@JSONField(name: "real_name")
	String realName;
}
