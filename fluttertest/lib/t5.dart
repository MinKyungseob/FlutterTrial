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

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    var url= Uri.https('examples.com');   //initialize
    var response= http.get(url);
    for (String arg in args) {
        String? number = arg;

        if (number != null) {
          url= Uri.parse(args.first);      //입력된 첫번째 url 만이 실행되게끔 제작.
            //img.Image? decodeWebP(http.readBytes(url));

          //response = fetchData(3);
          //response = http.get(url);
        }
      }

    return [
      url.toString(),
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
    //print(response.request);
    //print(response.statusCode);
    //print(response.body);
    loadImage(args);
    return response;
  }

  loadImage(List<String> args) async{
    var path= args.first;
    var dir = Directory(path);
    var files = dir.listSync();
    late List<int> trimRect;
    for(final f in files){
      if( f is !File)
      {
        continue;
      }
      final bytes = f.readAsBytesSync();
      final image = img.decodeImage(bytes);
      if (image == null) {
        continue;
      }
      if (trimRect == null) {
        trimRect = img.findTrim(image, mode: img.TrimMode.transparent);
      }
      final trimmed = img.copyCrop(image, x: trimRect[0], y: trimRect[1], 
                              width: trimRect[2], height: trimRect[3]);

      String name = f.uri.pathSegments.last;
      img.encodeImageFile('$path/trimmed-$name', trimmed);
      print('$path/trimmed-$name');
    }
  }
}