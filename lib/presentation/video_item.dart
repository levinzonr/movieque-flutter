import 'package:app/domain/video.dart';
import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  final Video _video;

  VideoItem(this._video);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(_video.imageUrl),
        ),
      ),
    );
  }
}
