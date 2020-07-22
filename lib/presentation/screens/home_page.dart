import 'package:app/data/mock_video.dart';
import 'package:app/presentation/screens/filter_setup_page.dart';
import 'package:app/presentation/screens/profile_page.dart';
import 'package:app/presentation/screens/video_item.dart';
import 'package:flutter/material.dart';
import 'package:app/presentation/screens/route_extensions.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:horizontal_blocked_scroll_physics/horizontal_blocked_scroll_physics.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _controller = PageController();
  final videos = MockVideos.all;

  ValueNotifier<double> _notifier = ValueNotifier<double>(0);


  @override
  void initState() {
    super.initState();

  }


  double calculateScale(int pos) {
      final inv =  _notifier.value / 100.0;
      return (inv - 1).abs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(flex: 1, child: _buildContainer(context)),
            Expanded(flex: 6, child: buildListView),
            Expanded(flex: 1, child: _buildBottom(context),)
          ],
        ),
      ),
    );
  }

  Widget get buildListView {
    return Swiper(
      loop: false,
      itemBuilder: (BuildContext context, int index) {
        return VideoItem(MockVideos.all[index]);
      },
      itemCount: MockVideos.all.length,
      itemWidth: 400.0,
      itemHeight: 800.0,
      physics: RightBlockedScrollPhysics(),
      layout: SwiperLayout.TINDER,
    );
  }

  onPageChanged(int newPage) {
    setState(() {
    });
  }

  Container _buildBottom(BuildContext context) =>
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
