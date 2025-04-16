import 'package:flutter/material.dart';

class ListItemDecoration extends StatelessWidget {
  final Widget child;

  const ListItemDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF2C2C2E)
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.withAlpha(20)
                : Colors.black.withAlpha(25),
            spreadRadius: 1,
            blurRadius: Theme.of(context).brightness == Brightness.dark ? 8 : 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
