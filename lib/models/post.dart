import 'image.dart';
import 'user.dart';

class PostModel{
  String id;
  String description;
  ImageModel image;
  UserModel user;

  PostModel({this.id, this.description, this.image, this.user});

  factory PostModel.fromJson(Map<String, dynamic> json){
    return PostModel(
      id: json['id'],
      description: json['description'] ?? json['alt_description'],
      image: ImageModel.fromJson(json['urls']),
      user: UserModel.fromJson(json['user'])
    );
  }
}