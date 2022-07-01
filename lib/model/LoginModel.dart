part of '../header.dart';

class LoginModel {
  bool? success;
  String? message;
  DataLogin? data;

  LoginModel({this.success, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataLogin.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataLogin {
  String? accessToken;
  UserLogin? user;

  DataLogin({this.accessToken, this.user});

  DataLogin.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = json['user'] != null ? new UserLogin.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserLogin {
  int? id;
  String? nrp;
  String? nama;
  String? email;
  String? jenisUser;
  String? usap;
  String? psap;
  String? wSite;
  String? oSite;
  String? pSite;

  UserLogin(
      {this.id,
      this.nrp,
      this.nama,
      this.email,
      this.jenisUser,
      this.usap,
      this.psap,
      this.wSite,
      this.oSite,
      this.pSite});

  UserLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nrp = json['nrp'];
    nama = json['nama'];
    email = json['email'];
    jenisUser = json['jenis_user'];
    usap = json['usap'];
    psap = json['psap'];
    wSite = json['w_site'];
    oSite = json['o_site'];
    pSite = json['p_site'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nrp'] = this.nrp;
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['jenis_user'] = this.jenisUser;
    data['usap'] = this.usap;
    data['psap'] = this.psap;
    data['w_site'] = this.wSite;
    data['o_site'] = this.oSite;
    data['p_site'] = this.pSite;
    return data;
  }
}
