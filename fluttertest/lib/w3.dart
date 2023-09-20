library min_dart;

import 'package:lib/study_lib.dart';
import 'package:fluttertest/minlib.dart';
import 'package:flutter/material.dart';                                     //https://api.flutter.dev/flutter/material/Slider-class.html

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

      //   body:Column(
      //   width: MediaQuery.of(context).size.width*.5,
      //   height: 60,
      //   decoration: BoxDecoration(
      //     color: Colors.green,
      //     borderRadius: BorderRadius.circular(45)
      //   ),
      //   child: Text(
      //     '$n %',
      //     textAlign: TextAlign.center,
      //     style: const TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black,
      //               fontSize: 20,
      //     ),
      //   ),
      // ),

class _W3MyWidgetTestWidgetState extends State<W3MyWidgetTestWidget>
{ 
  Duration elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Container(
              width: MediaQuery.of(context).size.width*.5,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(45)
              ),
              child:Text(
              '${(_currentSliderValue*100).round()} %',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
                ),
              ),
            ),
            SliderTheme(
            data: SliderTheme.of(context).copyWith(
            overlayShape: SliderComponentShape.noOverlay,),
            child: Container(
              width: MediaQuery.of(context).size.width*.45,
              height: 100,
              child: Slider(
              value: _currentSliderValue,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue=value;
                });
                },
              )
            )
          )
        ],
      )
    )
  );
  }
}