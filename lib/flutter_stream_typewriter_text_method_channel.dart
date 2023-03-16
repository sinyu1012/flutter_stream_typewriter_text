import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_stream_typewriter_text_platform_interface.dart';

/// An implementation of [FlutterStreamTypewriterTextPlatform] that uses method channels.
class MethodChannelFlutterStreamTypewriterText extends FlutterStreamTypewriterTextPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_stream_typewriter_text');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
