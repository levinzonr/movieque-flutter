import 'package:flutter/material.dart';
import 'package:horizontal_blocked_scroll_physics/horizontal_blocked_scroll_physics.dart';

class NotifyingPageView extends StatefulWidget {
  final ValueNotifier<double> notifier;
  final Function(BuildContext, int) builder;
  final int itemCount;

  const NotifyingPageView({Key key, this.notifier, this.builder, this.itemCount}) : super(key: key);

  @override
  _NotifyingPageViewState createState() => _NotifyingPageViewState();
}

class _NotifyingPageViewState extends State<NotifyingPageView> {
  int _previousPage;
  PageController _pageController;

  void _onScroll() {
    if (_pageController.page.toInt() == _pageController.page) {
      _previousPage = _pageController.page.toInt();
    }
    widget.notifier?.value = _pageController.page - _previousPage;
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    )..addListener(_onScroll);

    _previousPage = _pageController.initialPage;
    super.initState();
  }

  List<Widget> _pages; //pages generation omitted for the sake of brevity

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: this.widget.builder,
      itemCount: this.widget.itemCount,
      physics: RightBlockedScrollPhysics(),
      controller: _pageController,
    );

  }
}