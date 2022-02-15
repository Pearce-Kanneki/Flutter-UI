import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FlowMenuDelegate.dart';

class FlowMenu extends StatefulWidget {
  const FlowMenu({Key? key}) : super(key: key);

  @override
  _FlowMenuState createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {

  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 250)
    );
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter = MediaQuery
        .of(context)
        .size
        .width / menuItems.length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(icon);
          menuAnimation.status == AnimationStatus.completed ?
              menuAnimation.reverse() : menuAnimation.forward();
        },
        child: Icon(icon, color: Colors.white, size: 45.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
        delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      children: menuItems.map((IconData icon) => flowMenuItem(icon)).toList(),
    );
  }
}