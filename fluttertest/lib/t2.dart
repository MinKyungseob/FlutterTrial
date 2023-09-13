library min_dart;


import 'package:lib/study_lib.dart';

class T2 implements ITextTest {
  List<String> args = [];
  int count = 0;
  int timecount=0;
  String bars='-'*40;
  String chara='${'-'*20}K${'-'*19}';
  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    List<String> result= [];
    for(int i=0;i<20;i++)
    {
      result.add('-'*40);
    }
    if(elapsed.inMilliseconds/25>timecount)
    {
      timecount++;
      count=count%40;
      count++;
    }

    if(count%40<20 &&count%40>0)
    {
      result[(count-1)%20]=bars;
      result[count%20]=chara;
    }
    else if(count%40>20)
    {
      result[(count+1)%20]=bars;
      result[20-count%20]=chara;
    } 
    else if(count%40==0)
    {
      result[1]=bars;
      result[0]=chara;
    }
    return [
      'MilliSeconds: ${elapsed.inMilliseconds}ms',
      'Seconds: ${elapsed.inSeconds}s',
      ...result,      
    ];
  }

  @override
  String get authorName => 'minks';

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}