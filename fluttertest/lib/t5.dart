// ignore_for_file: file_names, prefer_conditional_assignment
//https://pub.dev/packages/image & https://pub.dev/packages/http 참조
//https://github.com/brendan-duncan/image/blob/main/example/example.dart  이미지 예시
//https://github.com/brendan-duncan/image/blob/main/doc/formats.md        이미지 디코딩 관련
//https://github.com/brendan-duncan/image/blob/main/doc/filters.md        이미지 필터 씌우는 방법 (grayscale로 전환하면 될듯)
//https://github.com/dart-lang/http/tree/master/pkgs/http                 http 관련 설명

library min_dart;

import 'dart:typed_data';

import 'package:fluttertest/minlib.dart';
import 'package:enough_ascii_art/enough_ascii_art.dart' as art;
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http; 
import 'package:lib/study_lib.dart';

var client = http.Client();
class T5 implements ITextTest {
  List<String> args = [];
  var asciiImage;

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    var url= Uri.https('examples.com');   //initialize
    for (String arg in args) {
        String? number = arg;

        if (number != null) {
          url= Uri.parse(args.first);      //입력된 첫번째 url 만이 실행되게끔 제작.
          //fetchData(3);
        }
      }

    return [
      url.toString(),
      if(asciiImage!=null) asciiImage,
      //fetchData(3),
    ];
  }

  @override
  String get authorName => 'minks';

  @override
  void setInput(List<String> args) {
    this.args = args;
    fetchData(3);
  }

  void net(url, response, image) async{
    response=await http.get(url);
    image=await decodeImageFromList(response.bytes);
  }

  fetchData(int id) async{  
    var uri = Uri.parse(args.first.toString());
    http.Response response = await http.get(uri);
    var databytes= response.bodyBytes;
    'bytes: $databytes'.ilog();
    var news= img.decodeImage(databytes)!;
    //final image=img.Image.fromBytes(databytes);
    'bytes: ${img.decodeImage(databytes)}'.ilog();
    img.decodeWebP(databytes);
    'bytes: ${img.decodeWebP(databytes)}'.ilog();
    img.WebPDecoder(databytes);
    'bytes: ${img.WebPDecoder(databytes)}'.ilog();
    img.grayscale(news);
    asciiImage=art.convertImage(news,maxWidth: 60,maxHeight: 60,invert: true);
    'asciicode'.ilog();
    asciiImage.ilog();


    // await (img.Command()
    //   ..decodeWebP(databytes)
    //   ..copyResize(width: 60, height: 60)
    //   ..writeToFile('C:\Users\양호식\Desktop\FlutterTest\fluttertest\lib\test.png'))
    // .executeThread();
  }
}