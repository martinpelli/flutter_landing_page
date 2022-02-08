import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_landing_page/providers/page_provider.dart';
import 'package:flutter_landing_page/ui/shared/custom_menu_item.dart';

import 'package:provider/provider.dart';

class CustomAppMenu extends StatefulWidget {
  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 150,
          height: isOpen ? 290 : 50,
          color: Colors.black,
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            _MenuTitle(
                isOpen: isOpen, animationController: animationController),
            if (isOpen) ...[
              CustomMenuItem(
                  delay: 0,
                  text: 'Home',
                  onPressed: () => pageProvider.goTo(0)),
              CustomMenuItem(
                  delay: 40,
                  text: 'About',
                  onPressed: () => pageProvider.goTo(1)),
              CustomMenuItem(
                  delay: 80,
                  text: 'Pricing',
                  onPressed: () => pageProvider.goTo(2)),
              CustomMenuItem(
                  delay: 120,
                  text: 'Contact',
                  onPressed: () => pageProvider.goTo(3)),
              CustomMenuItem(
                  delay: 10,
                  text: 'Location',
                  onPressed: () => pageProvider.goTo(4))
            ]
          ]),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.animationController,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: isOpen ? 30 : 0,
        ),
        Text('Menu',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
        Spacer(),
        AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: animationController,
          color: Colors.white,
        )
      ],
    );
  }
}
