library min_dart;

import 'package:lib/study_lib.dart';
import 'package:fluttertest/minlib.dart';
import 'dart:math' as math;

class W5 implements IWidgetTest {
  @override
  String get authorName=>'minks';
  
  @override
  StatefulWidget createWidget(BuildContext context, Key key)
  {
    return W5MyWidgetTestWidget(key: key);
  }
}

class W5MyWidgetTest implements IWidgetTest {
  @override
  String get authorName => 'minks';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W5MyWidgetTestWidget(key: key);
  }
}

class W5MyWidgetTestWidget extends StatefulWidget {
  const W5MyWidgetTestWidget({super.key});

  @override
  State<W5MyWidgetTestWidget> createState() => _W5MyWidgetTestWidgetState();
}

class _W5MyWidgetTestWidgetState extends State<W5MyWidgetTestWidget>
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