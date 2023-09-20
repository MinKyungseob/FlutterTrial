library min_dart;

import 'package:lib/study_lib.dart';
import 'package:fluttertest/minlib.dart';
import 'dart:math' as math;

class W8 implements IWidgetTest {
  @override
  String get authorName=>'minks';
  
  @override
  StatefulWidget createWidget(BuildContext context, Key key)
  {
    return W8MyWidgetTestWidget(key: key);
  }
}

class W8MyWidgetTest implements IWidgetTest {
  @override
  String get authorName => 'minks';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W8MyWidgetTestWidget(key: key);
  }
}

class W8MyWidgetTestWidget extends StatefulWidget {
  const W8MyWidgetTestWidget({super.key});

  @override
  State<W8MyWidgetTestWidget> createState() => _W8MyWidgetTestWidgetState();
}

class _W8MyWidgetTestWidgetState extends State<W8MyWidgetTestWidget>
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