import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../config/routes.dart';

class RouterUtil {
  navigateTo(BuildContext context, String url,
      {bool clearStack = false,
      TransitionType transition = TransitionType.inFromRight}) {
    Routes.router.navigateTo(context, url,
        clearStack: clearStack, transition: transition);
  }
}
