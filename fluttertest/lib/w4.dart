library min_dart;

import 'package:lib/study_lib.dart';
import 'package:fluttertest/minlib.dart';
import 'dart:math' as math;

class W4 implements IWidgetTest {
  @override
  String get authorName=>'minks';
  
  @override
  StatefulWidget createWidget(BuildContext context, Key key)
  {
    return W4MyWidgetTestWidget(key: key);
  }
}

class W4MyWidgetTest implements IWidgetTest {
  @override
  String get authorName => 'minks';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W4MyWidgetTestWidget(key: key);
  }
}

class W4MyWidgetTestWidget extends StatefulWidget {
  const W4MyWidgetTestWidget({super.key});

  @override
  State<W4MyWidgetTestWidget> createState() => _W4MyWidgetTestWidgetState();
}

class _W4MyWidgetTestWidgetState extends State<W4MyWidgetTestWidget>
{ 
  Color randCol= Color((math.Random().nextDouble()*0xFFFFFF).toInt()).withOpacity(1.0); 
  Duration elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width*.5,
        height: 100,
        decoration: BoxDecoration(
          color: randCol,
          borderRadius: BorderRadius.circular(45)
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              randCol=Color((math.Random().nextDouble()*0xFFFFFF).toInt()).withOpacity(1.0);
            });
          } 
        ,)
      ),
    );
  }
}