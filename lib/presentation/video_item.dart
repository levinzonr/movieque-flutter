import 'package:app/domain/video.dart';
import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  final Video _video;

  VideoItem(this._video);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: buildVideoInfoView(context),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 24),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            child: Icon(Icons.favorite),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }

  Widget buildVideoInfoView(BuildContext context) {
    return Image.network(_video.imageUrl, fit: BoxFit.fill,);
  }
}
