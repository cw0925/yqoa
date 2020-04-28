// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:yqoa/app/home/model/company_entity.dart';
import 'package:yqoa/generated/json/company_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case CompanyEntity:
			return companyEntityFromJson(data as CompanyEntity, json) as T;			case CompanyData:
			return companyDataFromJson(data as CompanyData, json) as T;			case CompanyDataUser:
			return companyDataUserFromJson(data as CompanyDataUser, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case CompanyEntity:
			return companyEntityToJson(data as CompanyEntity);			case CompanyData:
			return companyDataToJson(data as CompanyData);			case CompanyDataUser:
			return companyDataUserToJson(data as CompanyDataUser);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'CompanyEntity':
			return CompanyEntity().fromJson(json);			case 'CompanyData':
			return CompanyData().fromJson(json);			case 'CompanyDataUser':
			return CompanyDataUser().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'CompanyEntity':
			return List<CompanyEntity>();			case 'CompanyData':
			return List<CompanyData>();			case 'CompanyDataUser':
			return List<CompanyDataUser>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}