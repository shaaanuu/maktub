import 'package:flutter/material.dart';

class ListItemDecoration extends StatelessWidget {
  final Widget child;

  const ListItemDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: isDarkMode ? 8 : 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
