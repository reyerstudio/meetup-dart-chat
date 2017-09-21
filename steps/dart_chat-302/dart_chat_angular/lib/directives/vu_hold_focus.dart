import 'dart:html';

import 'package:angular/core.dart';

@Directive(selector: "[vuHoldFocus]")
class VuHoldFocus {
  Element _el;

  VuHoldFocus(ElementRef ref) {
    _el = ref.nativeElement;
  }

  @HostListener('blur')
  void onBlur() {
    _el.focus();
  }
}
