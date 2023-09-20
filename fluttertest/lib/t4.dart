library min_dart;

import 'package:lib/study_lib.dart';
                                                            //T4 Data-Container를 이용해서 setInput() 으로 받은 문자열 배열을 '문자 길이' 순으로 오름차순 정렬 후 출력 
                                                            //같은 길이일 경우 문자 순서상의 오름차순으로 정렬 (가 나 다 라 마 바 사~ a b c d e f g~)
class T4 implements ITextTest {
  List<String> args = [];
  List<String> sorted=[];

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    sorted=args;
    sorted.sort();                                          //일반적으로 sort를 사용하는 다른 언어처럼 ㄱ,ㄴ,ㄷ 순의 문자상의 오름차순으로 정렬
    sorted.sort((a,b)=>a.length.compareTo(b.length));       //https://api.flutter.dev/flutter/dart-core/List/sort.html 참조. 참고. 글자 길이별로 정렬.
                                                            //참고로 이론상 위의 두개의 순서를 바꾸면, 다른 결과가 나올 것으로 예상. 
                                                            //=> 글자수 짧은거에서 긴순 => 글자 오름차순 순서 => 앞에 글자수 순서 인것 뭉개짐.
    return sorted;

  }

  @override
  String get authorName => 'minks';

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}