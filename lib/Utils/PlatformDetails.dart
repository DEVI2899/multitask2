import 'package:flutter/foundation.dart';

class PlatformDetails{

  //private constructor
  PlatformDetails._internal();

  //static final instance
  static final PlatformDetails _singleton = PlatformDetails._internal();

  //static method
  factory PlatformDetails(){
    return _singleton;
  }

  bool get isDesktop =>
      defaultTargetPlatform == TargetPlatform.macOS ||
          defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.windows;
  bool get isMobile =>
      defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android;

}

