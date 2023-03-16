import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_typewriter_text_method_channel.dart';

abstract class FlutterTypewriterTextPlatform extends PlatformInterface {
  /// Constructs a FlutterTypewriterTextPlatform.
  FlutterTypewriterTextPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterTypewriterTextPlatform _instance = MethodChannelFlutterTypewriterText();

  /// The default instance of [FlutterTypewriterTextPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterTypewriterText].
  static FlutterTypewriterTextPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterTypewriterTextPlatform] when
  /// they register themselves.
  static set instance(FlutterTypewriterTextPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
