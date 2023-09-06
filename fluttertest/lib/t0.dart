library min_dart;

import 'package:fluttertest/minlib.dart';


abstract class ITextTest {
  String get authorName;
  List<String> getOutput(Duration elapsed, Duration delta);
  void setInput(List<String> args);
}

class T0 implements ITextTest{ 
  @override
  // TODO: implement authorName
  String get authorName => 'minks';
  
  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    // TODO: implement getOutput
    throw UnimplementedError();
  }
  
  @override
  void setInput(List<String> args) {
  }
  int num=0;
  int init=1;
  
  
}