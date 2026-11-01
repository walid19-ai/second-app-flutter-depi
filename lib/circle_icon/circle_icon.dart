import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(icon),
      backgroundColor: Colors.white,
      radius: 18,

    );
  }
}
