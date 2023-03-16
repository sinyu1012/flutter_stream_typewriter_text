import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_stream_typewriter_text_method_channel.dart';

abstract class FlutterStreamTypewriterTextPlatform extends PlatformInterface {
  /// Constructs a FlutterStreamTypewriterTextPlatform.
  FlutterStreamTypewriterTextPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterStreamTypewriterTextPlatform _instance = MethodChannelFlutterStreamTypewriterText();

  /// The default instance of [FlutterStreamTypewriterTextPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterStreamTypewriterText].
  static FlutterStreamTypewriterTextPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterStreamTypewriterTextPlatform] when
  /// they register themselves.
  static set instance(FlutterStreamTypewriterTextPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
