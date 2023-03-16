import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_typewriter_text/flutter_typewriter_text.dart';
import 'package:flutter_typewriter_text/flutter_typewriter_text_platform_interface.dart';
import 'package:flutter_typewriter_text/flutter_typewriter_text_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterTypewriterTextPlatform
    with MockPlatformInterfaceMixin
    implements FlutterTypewriterTextPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterTypewriterTextPlatform initialPlatform = FlutterTypewriterTextPlatform.instance;

  test('$MethodChannelFlutterTypewriterText is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterTypewriterText>());
  });

  test('getPlatformVersion', () async {
    FlutterTypewriterText flutterTypewriterTextPlugin = FlutterTypewriterText();
    MockFlutterTypewriterTextPlatform fakePlatform = MockFlutterTypewriterTextPlatform();
    FlutterTypewriterTextPlatform.instance = fakePlatform;

    expect(await flutterTypewriterTextPlugin.getPlatformVersion(), '42');
  });
}
