import 'dart:convert';

import 'package:http/http.dart';
import 'package:photo_gallery/models/imagesResponse.dart';

class PostsApi {
  Client http = Client();
  String apiHost = 'https://api.unsplash.com/photos';

  Future<ImagesResponse> fetchImages(String clientId) async {
    try {
      var response = await http.get(apiHost + '/?client_id=$clientId');
      if(response.statusCode==200){
        return ImagesResponse.fromJson(json.decode(response.body));
      }
      else if(response.statusCode>400 && response.statusCode<500){
        return ImagesResponse.withError("Something went wrong...Please write us!");
      }
      else if(response.statusCode>500){
        return ImagesResponse.withError("Oops! Something wrong with server...Sorry");
      }
      else{
        return ImagesResponse.withError("Something went wrong...Please reload app");
      }
      
    } catch (e) {
      return ImagesResponse.withError(e.toString());
    }
  }
}
