import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';

goTo(screen, {trans = PageTransitionType.leftToRight}) {

  var context = navigatorKey.currentContext;

  if(screen is String){
    return Navigator.of(context!).pushNamed(screen);
  }

  return Navigator.of(context!).push(PageTransition(child: screen, type: trans));
}

goToReplace(screen, {trans= PageTransitionType.leftToRight}) {
  var context = navigatorKey.currentContext;

  if(screen is String){
    return Navigator.of(context!).pushReplacementNamed(screen);
  }

  return Navigator.of(context!)
      .pushReplacement(PageTransition(child: screen, type: trans));
}

goToRemove(screen, {trans= PageTransitionType.leftToRight}) {
  var context = navigatorKey.currentContext;

  return Navigator.of(context!).pushAndRemoveUntil(
      PageTransition(child: screen, type: trans), (_) => false);
}