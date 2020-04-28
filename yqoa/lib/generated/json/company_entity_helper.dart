import 'package:yqoa/app/home/model/company_entity.dart';

companyEntityFromJson(CompanyEntity data, Map<String, dynamic> json) {
	if (json['errcode'] != null) {
		data.errcode = json['errcode']?.toInt();
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	if (json['pages'] != null) {
		data.pages = json['pages']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new List<CompanyData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CompanyData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> companyEntityToJson(CompanyEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errcode'] = entity.errcode;
	data['errmsg'] = entity.errmsg;
	data['pages'] = entity.pages;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

companyDataFromJson(CompanyData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}else{
		data.name = '';
	}
	if (json['ename'] != null) {
		data.ename = json['ename']?.toString();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['zip_code'] != null) {
		data.zipCode = json['zip_code']?.toString();
	}
	if (json['tel'] != null) {
		data.tel = json['tel']?.toString();
	}else{
		data.tel = '';
	}
	if (json['fax'] != null) {
		data.fax = json['fax'];
	}
	if (json['website'] != null) {
		data.website = json['website'];
	}
	if (json['wechat'] != null) {
		data.wechat = json['wechat'];
	}
	if (json['is_delete'] != null) {
		data.isDelete = json['is_delete']?.toInt();
	}
	if (json['uid'] != null) {
		data.uid = json['uid']?.toInt();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at']?.toString();
	}
	if (json['user'] != null) {
		data.user = new CompanyDataUser().fromJson(json['user']);
	}
	return data;
}

Map<String, dynamic> companyDataToJson(CompanyData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['ename'] = entity.ename;
	data['address'] = entity.address;
	data['zip_code'] = entity.zipCode;
	data['tel'] = entity.tel;
	data['fax'] = entity.fax;
	data['website'] = entity.website;
	data['wechat'] = entity.wechat;
	data['is_delete'] = entity.isDelete;
	data['uid'] = entity.uid;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	if (entity.user != null) {
		data['user'] = entity.user.toJson();
	}
	return data;
}

companyDataUserFromJson(CompanyDataUser data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid']?.toInt();
	}
	if (json['real_name'] != null) {
		data.realName = json['real_name']?.toString();
	}
	return data;
}

Map<String, dynamic> companyDataUserToJson(CompanyDataUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['real_name'] = entity.realName;
	return data;
}