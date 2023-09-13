library min_dart;

import 'package:lib/study_lib.dart';

class T1 extends ITextTest {
  List<String> args = [];

  var heart ='\u2665';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
  List<String> result= [];
  //가로40(하트+ 빈공간/스페이스) 세로20 공간 
  for(int i=0;i<20;i++)
  {
    result.add('$heart '*i);
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