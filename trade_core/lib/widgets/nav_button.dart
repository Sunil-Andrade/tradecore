import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.fun,
    required this.isClicked,
  });

  final IconData iconData;
  final String label;
  final VoidCallback fun;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),

            color: isClicked ? Colors.grey[400] : Colors.transparent,
          ),
          child: Row(
            children: [Icon(iconData), SizedBox(width: 10), Text(label)],
          ),
        ),
      ),
    );
  }
}
