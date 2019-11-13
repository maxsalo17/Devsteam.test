import 'package:photo_gallery/models/imagesResponse.dart';
import 'package:photo_gallery/services/api.dart';
import 'package:photo_gallery/services/userUtils.dart';
import 'package:rxdart/rxdart.dart';

class ImagesBloc{
  PostsApi _api = PostsApi();

  BehaviorSubject<ImagesResponse> _subject = BehaviorSubject<ImagesResponse>();
  Stream<ImagesResponse> get subject => _subject.stream;

  fetchImages() async {
    ImagesResponse response = await _api.fetchImages(UserUtils.token);
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

}