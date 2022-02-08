import 'package:flutter/material.dart';
import 'package:flutter_landing_page/ui/shared/custom_menu_item.dart';
import 'package:google_fonts/google_fonts.dart';

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
              CustomMenuItem(delay: 0, text: 'Home', onPressed: () {}),
              CustomMenuItem(delay: 20, text: 'About', onPressed: () {}),
              CustomMenuItem(delay: 40, text: 'Pricing', onPressed: () {}),
              CustomMenuItem(delay: 60, text: 'Contact', onPressed: () {}),
              CustomMenuItem(delay: 80, text: 'Location', onPressed: () {})
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
