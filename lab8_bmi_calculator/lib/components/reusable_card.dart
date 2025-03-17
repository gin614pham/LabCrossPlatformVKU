import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget childCard;
  final Color color;

  ReusableCard({required this.childCard, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: childCard,
    );
  }
}
