// ignore_for_file: file_names

library min_dart;

import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:lib/src/itext_test.dart';
import 'package:lib/study_lib.dart';

class T62 implements ITextTest, IKeyListenable {
  List<String> args = [];
  String bars='-'*40;
  int count = 0;
  int timecount=0;
  int x=0, y=0;
  int fps= 8;
  List<String> charAni=['o', 'O', '0', 'O', 'o'];
  //List<String> charAni=['1', '2', '3', '4', '5', '6', '7','8'];

  int shootCount=0;
  String shootingway='d';
  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    List<String> result= [];
    for(int i=0;i<20;i++)
    {
      result.add('_'*40);
    }
    if(elapsed.inMilliseconds/(1000/fps)>timecount)
    {
      timecount++;
      count=count%40;
      count++;
    }
    result[y]='_'*x + charAni[timecount%(charAni.length)]+'_'*(39-x);
        return [
          'Elapsed: ${elapsed.inMilliseconds}ms',
          'Elapsed: ${elapsed.inSeconds}s',
          'SCount : $shootCount',
          'SWay   : $shootingway',
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
    shootingway='w';
    if(y<=0) {
      y=y;
    }
    else
      y=y-1;
  }
	if( event.logicalKey == LogicalKeyboardKey.keyS)
  {
    shootingway='s';
    if(y>=19){ 
      y=y;
    }
    else
      y=y+1;
  }
	if( event.logicalKey == LogicalKeyboardKey.keyA)
  {
    shootingway='a';
    if(x<=0){
      x=x;
    }
    else
      x=x-1;
  }
	if( event.logicalKey == LogicalKeyboardKey.keyD)
  {
    shootingway='d';
    if(x>=39){
      x=x;
    }
    else
      x=x+1;
  }
  if(event.logicalKey ==LogicalKeyboardKey.space)
  {
    shootCount++;
  }
    // TODO: implement onKey
  }
}