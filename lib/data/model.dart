/// function: bean
/// <p>Created by Leo on 2019/5/10.</p>

class UserInfoModel {
  String phone;
  String password;

  UserInfoModel({this.phone, this.password});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    this.phone = json['phone'];
    this.password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}
