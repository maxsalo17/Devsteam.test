import 'package:photo_gallery/models/post.dart';

class ImagesResponse{
  List<PostModel> posts;
  String error;

  ImagesResponse({this.posts, this.error});

  factory ImagesResponse.fromJson(List<dynamic> json){
    List<PostModel> list = List<PostModel>();
    list = json.map((i)=>PostModel.fromJson(i)).toList();
    
    return ImagesResponse(
      posts: list
    );
  }

  factory ImagesResponse.withError(String error){
    return ImagesResponse(
      error: error
    );
  }
}