library min_dart;

import 'package:lib/study_lib.dart';

class T0 implements ITextTest {
  List<String> args = [];

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
  List<String> result= [];

  for (String arg in args) {            //List<String> 으로 받을 경우=> 해결 못해서 GPT의 도움 받음.
      int? number = int.tryParse(arg);

      if (number != null) {
        for (int i = 1; i <= 9; i++) {                    //for문과 result.add 부분까지는 구상 및 제작하였으나 number에 값을 가져오는 것을 못하여... 흠..
          result.add('$number * $i = ${number * i}');
        }
          result.add(' ');
      } else {
        result.add('Invalid input: $arg');
      }
    }
 
    return result;
  }

  @override
  String get authorName => 'minks';

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}