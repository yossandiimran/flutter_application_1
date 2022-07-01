class SettingNetworkModel {
  bool? success;
  String? message;
  List<DataSettingNetwork>? data;

  SettingNetworkModel({this.success, this.message, this.data});

  SettingNetworkModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSettingNetwork>[];
      json['data'].forEach((v) {
        data!.add(new DataSettingNetwork.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataSettingNetwork {
  int? id;
  String? nameSetting;
  String? value;

  DataSettingNetwork({this.id, this.nameSetting, this.value});

  DataSettingNetwork.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSetting = json['name_setting'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_setting'] = this.nameSetting;
    data['value'] = this.value;
    return data;
  }
}
