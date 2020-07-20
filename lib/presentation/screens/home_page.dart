import 'package:app/data/mock_video.dart';
import 'package:app/presentation/screens/filter_setup_page.dart';
import 'package:app/presentation/screens/profile_page.dart';
import 'package:app/presentation/screens/video_item.dart';
import 'package:flutter/material.dart';
import 'package:app/presentation/screens/route_extensions.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(flex: 1, child: _buildContainer(context)),
            Expanded(flex: 6, child: buildListView),
            Expanded(flex: 1, child: _buidBottom(context),)
          ],
        ),
      ),
    );
  }

  Widget get buildListView {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (c, i) => VideoItem(MockVideos.all[i]),
      itemCount: MockVideos.all.length,
    );
  }

  Container _buidBottom(BuildContext context) =>
      Container(
        child: MaterialButton(child: Text("_filter"), onPressed: () =>
        {
          context.push(FilterSetupPage(), isFoolScreenDialog: true)
        },),
      );

  Widget _buildContainer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        MaterialButton(
          onPressed: () =>
              context.push(ProfilePage(), isFoolScreenDialog: true),
          child: Icon(Icons.account_box, color: Colors.white, size: 56,),
        ),
      ],
    );
  }
}
