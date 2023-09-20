library min_dart;

import 'package:lib/study_lib.dart';
import 'package:fluttertest/minlib.dart';

class W2 implements IWidgetTest {
  @override
  String get authorName=>'minks';
  
  @override
  StatefulWidget createWidget(BuildContext context, Key key)
  {
    return W2MyWidgetTestWidget(key: key);
  }
}

class W2MyWidgetTest implements IWidgetTest {
  @override
  String get authorName => 'minks';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W2MyWidgetTestWidget(key: key);
  }
}

class W2MyWidgetTestWidget extends StatefulWidget {
  const W2MyWidgetTestWidget({super.key});

  @override
  State<W2MyWidgetTestWidget> createState() => _W2MyWidgetTestWidgetState();
}

class _W2MyWidgetTestWidgetState extends State<W2MyWidgetTestWidget>
{ 
  Color randCol= Colors.lightBlue; //언제나 보라색
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
        height: 70,
        decoration: BoxDecoration(
          color: randCol,
          borderRadius: BorderRadius.circular(12)       //20을 넘어가면 거의 캡슐모양으로.. 25이상은 완전 캡슐
        ),
        child: Row(
          children:<Widget>[
            const Padding(
              padding:EdgeInsets.fromLTRB(10, 0, 0, 0) 
              ),
            Icon(
              Icons.circle_outlined,
              color: Colors.blue.shade900,
              size: 60,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding:EdgeInsets.fromLTRB(30, 10, 0, 0),              
              ),
                Text(
                  "갱습이",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    fontSize: 20,
                  ) ,
                ),
                Text(
                  "냐옹이는 귀여워",
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Expanded(
              child: Align(
              alignment: const Alignment(0.95,0),
                child:Icon(
                Icons.arrow_forward_rounded,
                color: Colors.blue.shade900,
                size: 30,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}