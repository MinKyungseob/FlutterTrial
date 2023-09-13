// ignore_for_file: file_names

library min_dart;

import 'package:lib/study_lib.dart';

class Sample implements ITextTest {
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