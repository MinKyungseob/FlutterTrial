library min_dart;

import 'package:lib/study_lib.dart';
import 'package:flutter/material.dart';

class W0 implements IWidgetTest {
  @override
  String get authorName=>'minks';
  
  @override
  StatefulWidget createWidget(BuildContext context, Key key)
  {
    return W0MyWidgetTestWidget(key: key);
  }
}

class W0MyWidgetTest implements IWidgetTest {
  @override
  String get authorName => 'minks';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W0MyWidgetTestWidget(key: key);
  }
}

class W0MyWidgetTestWidget extends StatefulWidget {
  const W0MyWidgetTestWidget({super.key});

  @override
  State<W0MyWidgetTestWidget> createState() => _W0MyWidgetTestWidgetState();
}

class _W0MyWidgetTestWidgetState extends State<W0MyWidgetTestWidget>
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