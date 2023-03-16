
import 'flutter_typewriter_text_platform_interface.dart';

class FlutterTypewriterText {
  Future<String?> getPlatformVersion() {
    return FlutterTypewriterTextPlatform.instance.getPlatformVersion();
  }
}
