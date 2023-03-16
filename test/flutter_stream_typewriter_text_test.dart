import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_stream_typewriter_text/flutter_stream_typewriter_text.dart';
import 'package:flutter_stream_typewriter_text/flutter_stream_typewriter_text_platform_interface.dart';
import 'package:flutter_stream_typewriter_text/flutter_stream_typewriter_text_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterStreamTypewriterTextPlatform
    with MockPlatformInterfaceMixin
    implements FlutterStreamTypewriterTextPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterStreamTypewriterTextPlatform initialPlatform = FlutterStreamTypewriterTextPlatform.instance;

  test('$MethodChannelFlutterStreamTypewriterText is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterStreamTypewriterText>());
  });

  test('getPlatformVersion', () async {
    FlutterStreamTypewriterText flutterStreamTypewriterTextPlugin = FlutterStreamTypewriterText();
    MockFlutterStreamTypewriterTextPlatform fakePlatform = MockFlutterStreamTypewriterTextPlatform();
    FlutterStreamTypewriterTextPlatform.instance = fakePlatform;

    expect(await flutterStreamTypewriterTextPlugin.getPlatformVersion(), '42');
  });
}
