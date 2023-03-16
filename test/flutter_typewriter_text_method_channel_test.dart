import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_typewriter_text/flutter_typewriter_text_method_channel.dart';

void main() {
  MethodChannelFlutterTypewriterText platform = MethodChannelFlutterTypewriterText();
  const MethodChannel channel = MethodChannel('flutter_typewriter_text');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
