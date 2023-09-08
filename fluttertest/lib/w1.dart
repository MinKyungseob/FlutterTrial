library min_dart;

import 'package:lib/study_lib.dart';
import 'package:fluttertest/minlib.dart';
import 'dart:math' as math;

class W1 implements IWidgetTest {
  @override
  String get authorName=>'minks';
  
  @override
  StatefulWidget createWidget(BuildContext context, Key key)
  {
    return W1MyWidgetTestWidget(key: key);
  }
}

class W1MyWidgetTest implements IWidgetTest {
  @override
  String get authorName => 'minks';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W1MyWidgetTestWidget(key: key);
  }
}

class W1MyWidgetTestWidget extends StatefulWidget {
  const W1MyWidgetTestWidget({super.key});

  @override
  State<W1MyWidgetTestWidget> createState() => _W1MyWidgetTestWidgetState();
}

class _W1MyWidgetTestWidgetState extends State<W1MyWidgetTestWidget>
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
          borderRadius: BorderRadius.circular(17)       //20을 넘어가면 거의 캡슐모양으로.. 25이상은 완전 캡슐
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