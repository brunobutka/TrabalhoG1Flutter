import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class User{
  int id;
  String name;
  String species;
  String gender;
  String image;
  String created_at;
  String updated_at;

  User(
    {required this.id, 
    required this.name, 
    required this.species,
    required this.gender, 
    required this.image, 
    required this.created_at, 
    required this.updated_at});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class ResponseData{
  List<dynamic>data;

  ResponseData(
    {required this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

}