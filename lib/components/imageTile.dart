import 'package:flutter/material.dart';
import 'package:photo_gallery/models/post.dart';
import 'package:photo_gallery/pages/imagePage.dart';

class PostTile extends StatefulWidget {
  final PostModel postModel;

  PostTile({@required this.postModel});
  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) {
   return InkWell(
          onTap: (){_openPhoto(context, widget.postModel.image.regular);},
                  child: Container(
            child: Stack(
              children: <Widget>[
                Center(child: SizedBox.expand(child: Image.network(widget.postModel.image.small, fit: BoxFit.cover,))),
                Container(decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black38,
                      Colors.transparent
                    ]
                  )
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(widget.postModel.description ?? "", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300), maxLines: 3, overflow: TextOverflow.ellipsis,),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "By: ", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200)),
                              TextSpan(text: widget.postModel.user.username, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),)
                            ]
                          ),
                        ),                  
                      ],
                    ),
                ))
              ],
            ),
          ),
        );
  }

  _openPhoto(BuildContext context, String url) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePage(imageSrc: url,)));
  }
}