library min_dart;

import 'package:fluttertest/minlib.dart';
import 'package:lib/study_lib.dart';
                                                          //T4 Data-Container를 이용해서 setInput() 으로 받은 문자열 배열을 '문자 길이' 순으로 오름차순 정렬 후 출력 
                                                          //같은 길이일 경우 문자 순서상의 오름차순으로 정렬 (가 나 다 라 마 바 사~ a b c d e f g~)
class T4 implements ITextTest {
  List<String> args = [];

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    return [
      'Elapsed: ${elapsed.inMilliseconds}ms',
      'Delta: ${delta.inMilliseconds}ms',
      ...args,
    ];
  }

  @override
  String get authorName => 'minks';

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}