library min_dart;

import 'package:lib/study_lib.dart';
import 'package:fluttertest/minlib.dart';

class W0 implements IWidgetTest {
  @override
  String get authorName=>'minks';
  
  @override
  StatefulWidget createWidget(BuildContext context, Key key)
  {
    return MyWidgetTestWidget(key: key);
  }
}

class MyWidgetTest implements IWidgetTest {
  @override
  String get authorName => 'minks';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return MyWidgetTestWidget(key: key);
  }
}

class MyWidgetTestWidget extends StatefulWidget {
  const MyWidgetTestWidget({super.key});

  @override
  State<MyWidgetTestWidget> createState() => _MyWidgetTestWidgetState();
}

class _MyWidgetTestWidgetState extends State<MyWidgetTestWidget>
    implements ITickerState {
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
      child: Text(
        'Test ${elapsed.inMilliseconds}ms',
      ),
    );
  }

  @override
  void onTick(Duration elapsed, Duration delta) {
    safeSetState(() {
      this.elapsed = elapsed;
    });
  }
}