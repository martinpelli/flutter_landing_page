//import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    this.scrollController =
        PageController(initialPage: getPageIndex(routeName));
    this.scrollController.addListener(() {
      final pageIndex = (this.scrollController.page ?? 0).round();
      if (pageIndex != _currentIndex) {
        html.document.title = _pages[pageIndex];
        html.window.history.pushState(null, 'none', '#/${_pages[pageIndex]}');
        _currentIndex = pageIndex;
      }
    });
  }

  int getPageIndex(String routeName) {
    final index = _pages.indexOf(routeName);
    if (index == -1) {
      return 0;
    } else {
      return index;
    }
  }

  goTo(int index) {
    scrollController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
