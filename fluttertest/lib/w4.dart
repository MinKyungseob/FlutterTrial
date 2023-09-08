library min_dart;

import 'package:lib/study_lib.dart';
import 'package:fluttertest/minlib.dart';
import 'dart:math' as math;

class W3 implements IWidgetTest {
  @override
  String get authorName=>'minks';
  
  @override
  StatefulWidget createWidget(BuildContext context, Key key)
  {
    return W3MyWidgetTestWidget(key: key);
  }
}

class W3MyWidgetTest implements IWidgetTest {
  @override
  String get authorName => 'minks';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W3MyWidgetTestWidget(key: key);
  }
}

class W3MyWidgetTestWidget extends StatefulWidget {
  const W3MyWidgetTestWidget({super.key});

  @override
  State<W3MyWidgetTestWidget> createState() => _W3MyWidgetTestWidgetState();
}

class _W3MyWidgetTestWidgetState extends State<W3MyWidgetTestWidget>
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