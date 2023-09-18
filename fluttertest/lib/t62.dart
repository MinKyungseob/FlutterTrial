// ignore_for_file: file_names

library min_dart;

import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:lib/src/itext_test.dart';
import 'package:lib/study_lib.dart';

class T62 implements ITextTest, IKeyListenable {
  int movecount=0;
  List<String> args = [];
  String bars='-'*40;
  String chara='${'-'*20}K${'-'*19}';

  int charX=0, charY=0;                   //캐릭터 위치.
  int monX=39, monY=19;             //몬스터 위치.
  
  
  int xmin=0,xmax=39,ymin=0,ymax=19;      //범위에 관련된 변수

  int count = 0;
  int charAnimFrame=0, guntime=0, montime=0;         //시간과 관련된 변수
  int fps= 8, gunframe=20,monFrame=5;//1초에 해당 순간만큼 반복되게끔 이용하기 위한 변수. (inMilliseconds/(1000/해당 변수))>위의 타이머

  List<String> charAni=['o', 'O', '0', 'O', 'o'];
  List<String> monAni=['M'];
  
  String gunWay='d';
  String gunShot='*';
  int shoot=0;
  int bulletcount=0;
  //List<String> charAni=['1', '2', '3', '4', '5', '6', '7','8'];
  List<String> result= List.filled(20,'_'*40);                //이런 방식도 있네...
  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    //List<String> result=[];
    for(int i=0;i<20;i++)
    {
      result[i]=('_'*40);
    }
    if(elapsed.inMilliseconds/(1000/fps)>charAnimFrame)
    {
      charAnimFrame++;
      count=count%40;
      count++;
    }
    if(elapsed.inMilliseconds/(1000/gunframe)>guntime)
    {
      guntime++;
    }
    if(movecount>=5)
    {    if(elapsed.inMilliseconds/(1000/monFrame)>montime)
        {
          montime++;
          if(monX>charX) {monX--;}
          else if(monX<charX) {monX++;}
          else if(monY>charY) {monY--;}
            else if(monY<charY) {monY++;}
        }
    }

    result[charY]='_'*charX + charAni[charAnimFrame%(charAni.length)]+'_'*(39-charX);
    // if(shoot==true)
    // {
    //   if(gunWay=='w')
    //   {
    //     if(charY-guntime%20>=0){
    //       result[charY-guntime%20]='_'*charX + gunShot+'_'*(39-charX);
    //     }
    //   }
    //   if(gunWay=='s')
    //   {
    //     if(charY+guntime%20<=19){
    //       result[charY+guntime%20]='_'*charX + gunShot+'_'*(39-charX);
    //     }
    //   }
    //   if(gunWay=='a')
    //   {
        
    //   }
    //   if(gunWay=='d')
    //   {
        
    //   }
    // }
    if(bulletcount!=shoot)
    {
      if(gunWay=='w')
      {
        if(charY-guntime%20>=0){
          result[charY-guntime%20]='_'*charX + gunShot+'_'*(39-charX);
        }
        else bulletcount++;
      }
      if(gunWay=='s')
      {
        if(charY+guntime%20<=19){
          result[charY+guntime%20]='_'*charX + gunShot+'_'*(39-charX);
        }
        else bulletcount++;
      }
      if(gunWay=='a')
      {
        if(charX-guntime%20>=0){
          result[charY]='_'*(charX-guntime%20) + gunShot+'_'*(39-(charX-guntime%20));
        }
        else bulletcount++;
      }
      if(gunWay=='d')
      {
        if(charX+guntime%20<=39){
          result[charY]='_'*(charX+guntime%20) + gunShot+'_'*(39-(charX+guntime%20));
        }
        else bulletcount++;
      }
    }
    result[monY]='_'*monX+monAni[monFrame%(monAni.length)]+'_'*(39-monX);
    if(monY==charY)
    {
      if(charX>monX)
      {
        result[charY]='_'*monX + monAni[monFrame%(monAni.length)]+'_'*(charX-monX-1).abs()+charAni[charAnimFrame%(charAni.length)]+'_'*(39-charX);
      }
      else if(charX<monX)
      {
        result[charY]='_'*charX + charAni[charAnimFrame%(charAni.length)]+'_'*(monX-charX-1).abs()+monAni[monFrame%(monAni.length)]+'_'*(39-monX);
      }
    }
        return [
          'Elapsed: ${elapsed.inMilliseconds}ms',
          'Elapsed: ${elapsed.inSeconds}s',
          'shootingway: $gunWay',
          'guntime: $guntime',
          'count: $count',
          'charAnimFrame: $charAnimFrame',
          'shoot: $shoot',
          'bullet: $bulletcount',
          ...result,
      
    ];
  }

  @override
  String get authorName => 'minks';

  @override
  void setInput(List<String> args) {
    this.args = args;
  }

  @override
  void onKey(KeyEvent event, KeyEventAct act) {
    if( act == KeyEventAct.up ) return ;

    if( event.logicalKey == LogicalKeyboardKey.keyW)
    {
      movecount++;
      gunWay='w';
      if(charY<=0) {
        charY=charY;
      }
      else{
        charY=charY-1;
      }
    }
    if( event.logicalKey == LogicalKeyboardKey.keyS)
    {
      movecount++;
      gunWay='s';
      if(charY>=19){ 
        charY=charY;
      }
      else{
        charY=charY+1;
      }
    }
    if( event.logicalKey == LogicalKeyboardKey.keyA)
    {
      movecount++;
      gunWay='a';
      if(charX<=0){
        charX=charX;
      }
      else{
        charX=charX-1;
      }
    }
    if( event.logicalKey == LogicalKeyboardKey.keyD)
    {
      movecount++;
      gunWay='d';
      if(charX>=39){
        charX=charX;
      }
      else{
        charX=charX+1;   
      }
    }

    if(event.logicalKey==LogicalKeyboardKey.space)
    {
      shoot++;
    }
    // TODO: implement onKey
  }
}