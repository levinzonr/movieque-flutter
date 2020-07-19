import 'package:app/data/mock_video.dart';
import 'package:app/presentation/video_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(flex: 1,child: buildContainer),
            Expanded(flex: 6, child: buildListView),
            Expanded(flex: 1, child: buidBottom,)
          ],
        ),
      ),
    );
  }

  Widget get buildListView {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (c, i) =>  VideoItem(MockVideos.all[i]),
      itemCount: MockVideos.all.length,
    );
  }

  Container get buidBottom => Container(
    child: RaisedButton(child: Text("_filter"), onPressed: () => {},),
  );

  Widget get buildContainer => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 16),
        child: Icon(Icons.account_box, color: Colors.white, size: 56,),
      ),
    ],
  );
}
