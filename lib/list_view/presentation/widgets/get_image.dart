import 'package:flutter/cupertino.dart';

ImageProvider getImage(String url) {
  try {
    return NetworkImage(url);
  } catch (exception) {
    print(exception);
    return AssetImage('images/video-thumbnail-default.png');
  }
}
