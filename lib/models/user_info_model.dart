// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserInfoModel {
  String? name;
  String? urlImagem;
  String? userName;
  String? skills;

  UserInfoModel({
    this.name,
    this.urlImagem,
    this.userName,
    this.skills,
  });

  

  UserInfoModel copyWith({
    String? name,
    String? urlImagem,
    String? userName,
    String? skills,
  }) {
    return UserInfoModel(
      name: name ?? this.name,
      urlImagem: urlImagem ?? this.urlImagem,
      userName: userName ?? this.userName,
      skills: skills ?? this.skills,
    );
  }
}
