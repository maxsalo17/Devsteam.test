import 'package:flutter/material.dart';
import 'package:photo_gallery/bloc/imagesBloc.dart';
import 'package:photo_gallery/components/imageTile.dart';
import 'package:photo_gallery/models/imagesResponse.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  ImagesBloc bloc = ImagesBloc();

  @override
  void initState() {
    bloc.fetchImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Unsplash Gallery', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 22),),
      ),
      body: Container(
        child: StreamBuilder<ImagesResponse>(
          stream: bloc.subject,
          builder: (context, snapshot) {
            if(snapshot.hasData&&snapshot.data.posts!=null){
              if(snapshot.data.posts.isEmpty){
                return _buildError("No image");
              }
              else{
                return _buildImages(snapshot.data);
              }
            }
            else if(snapshot.hasData&&snapshot.data.error!=null){
              return _buildError(snapshot.data.error);
            }
            else if(snapshot.hasError){
              return _buildError(snapshot.error);
            }
            else{
              return _buildLoadingIndicator();
            }
          }
        )
      ),
    );
  }

  _buildImages(ImagesResponse response){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: response.posts.length,
      itemBuilder: (context, index){
        return PostTile(postModel: response.posts[index],);
      },
    );
  }

  _buildLoadingIndicator(){
    return Center(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(),
                ),
              );
  }

  _buildError(String error){
    return Center(child: 
                Text(error));
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}