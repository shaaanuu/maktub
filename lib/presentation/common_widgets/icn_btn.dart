import 'package:flutter/material.dart';

class IcnBtn extends StatelessWidget {
  const IcnBtn({
    Key? key,
    this.onTap,
    required this.icn,
    required this.clr,
  }) : super(key: key);

  final void Function()? onTap;
  final IconData icn;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? () {},
      icon: Icon(icn),
      color: clr,
      splashRadius: 20,
    );
  }
}
