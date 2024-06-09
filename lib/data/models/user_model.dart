import 'package:JoDija_DataSource/model/user/base_model/base_user_module.dart';

class AppuserModel extends UsersBaseModel {

 String ? firstName ;
  String ? lastName ;

 String ? phone ;


  AppuserModel ({
    this.firstName , this.lastName  ,  this.phone   ,
      String? id ,      String? email  })
      :super (email: email     );

  AppuserModel.   formJson(Map<String , dynamic> json ){
    this.firstName = json["firstName"] ;
    this.lastName = json["lastName"] ;
    this.phone = json["phone"] ;
    this.email = json["email"] ;
    this.phone = json["phone"] ;
    this.token = json["token"] ;
  }
  Map<String, dynamic> toJson() {
    final _data =  super.map;
    _data["firstName"] = firstName;
    _data["lastName"] = lastName;
    _data["phone"] = phone;
    _data["email"] = email;
    _data["phone"] = phone;

    return _data ;
  }
}