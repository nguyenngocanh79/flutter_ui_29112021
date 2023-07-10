import 'package:flutter/material.dart';

class PageViewTest extends StatefulWidget {
  List<Widget> widgetList;
  PageViewTest({Key? key, required this.widgetList}) : super(key: key);

  @override
  _PageViewTestState createState() => _PageViewTestState();
}

class _PageViewTestState extends State<PageViewTest> with TickerProviderStateMixin{
  late PageController controller;
  late AnimationController _controller;
  int currentpage = 0;

  @override
  dispose() {
    controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    controller = PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.65,
    );
    _controller = AnimationController(
      duration: const Duration(microseconds: 1),
      vsync: this,
    )..repeat();
  }
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      onPageChanged: (value) {
        setState(() {
          currentpage = value;
        });
      },
      controller: controller,
      itemCount: widget.widgetList.length,
      itemBuilder:(context, index)=> _buildWidgetListWidget(widget.widgetList,index),


    );
  }

  _buildWidgetListWidget(List<Widget> widgetList, int index) {
    return AnimatedBuilder(
      // animation: controller,
      animation: _controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page! - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 250,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
      child: widgetList[index],
    );
  }
}
