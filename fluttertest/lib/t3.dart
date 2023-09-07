library min_dart;

import 'dart:html';

import 'package:fluttertest/minlib.dart';
import 'package:lib/study_lib.dart';
                                                              //main 개념. 1.5초의 주기를 가지고, x 축 기준 왕복 1.5초이므로, 왕복하면 1주기를 채움.
class T3 implements ITextTest {                               //주기가 1.5초에 sin파형이고, x축의 경우 편도 0.75초. => 왕복하면 1주기 끝남. => 원상복귀..?
  List<String> args = [];
  int xcount = Random().nextInt(40);                          //x 시작점 랜덤값 주기. 다른 특정 값을 준다면.. 그값에 따른 변화 없는 것 처럼 보여 재미 down. but y위치는 언제든 중앙을 기준으로 잡음. 약 9.5를 기준으로.
  int ycount = 9;
  int sfcount=0;
  String bars='_'*40;
  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    List<String> result= [];
    // for(int i=0;i<20;i++)   //모든 공간 - 로 도배
    // {
    //   result.add('-'*40);
    // }
    if(elapsed.inMicroseconds/18750>sfcount)  //0.01875 초에 한번씩 이동해서 40번 해야 0.75초 (1 편도 가능) 
    {
      sfcount++;
      xcount=xcount%80;
      xcount++;
      ycount=(9.5 + 9*sin((pi/40)*sfcount)).floor();        //sin(180.0*(pi/180.0))=> pi => 0.5주기. 0.75초 예시로 40프레임=> sfcount/40 를 곱해준다면..?
                                                              //sfcount 대신 xcount를 대입하면 언제나 같은 값에 같은 위치로 고정. 재미 없음.
                                                              //9.5 +- 9.5 => 0~ 19 로 List 20 에 적합한 0~19 사이 인데.. 왜 오류가 뜰까..?
    }

    //ycount 는 10을 기준으로.. 어떻게 할까... 직접 구하기에는 이쁘지가 않을 테고.. dart:math 쓰면 소수점을 round 이용해서 반올림 하면 될..려나?
    //for 문 다시 쓰면 복잡도 2n인데.. 이전꺼는 한번 훑고 이후에 하면 되서 상관이 없었지만.. 여기서는? barmaking 함수로 만들어보자.
    if(xcount>0 && xcount <40)              //오른쪽으로 갈때
    {
      barmaking(result, ycount);
      String chara='${'_'*xcount}K${'_'*(39-xcount)}';          //x값 위치
      result[ycount]=chara;
    }
    else if(xcount>=40)                      //왼쪽으로 돌아갈때
    {
      barmaking(result, ycount);
      String chara='${'_'*(39-xcount%40)}K${'_'*(xcount%40)}';    //x값 위치
      result[ycount]=chara;
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
  void barmaking(List<String> result,int ycount ){
    for(int i=0;i<20;i++)   //모든 공간 - 로 도배
    {
      if(i==ycount) 
      {
        continue;
      }
      result.add('_'*40);
    }
  }
}