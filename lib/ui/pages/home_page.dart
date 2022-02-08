import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_landing_page/ui/shared/custom_app_menu.dart';

import 'package:flutter_landing_page/ui/views/home_view.dart';
import 'package:flutter_landing_page/ui/views/about_view.dart';
import 'package:flutter_landing_page/ui/views/pricing_view.dart';
import 'package:flutter_landing_page/ui/views/contact_view.dart.dart';
import 'package:flutter_landing_page/ui/views/location_view.dart';

import 'package:provider/provider.dart';
import 'package:flutter_landing_page/providers/page_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            Positioned(right: 20, top: 20, child: CustomAppMenu())
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.pink, Colors.purpleAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5]));
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      controller: pageProvider.scrollController,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()
      ],
    );
  }
}
