import 'package:flutter/material.dart';

class GQbutton extends StatelessWidget {
  const GQbutton({super.key, required this.title, required this.action});

  final String title;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: -4,
            blurRadius: 8,
            offset: const Offset(0, 8)),
        BoxShadow(
            color: Colors.black.withOpacity(0.12),
            spreadRadius: -4,
            blurRadius: 6,
            offset: const Offset(0, 4))
      ]),
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size.fromHeight(52),
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black),
          onPressed: action,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(title),
              ),
            ],
          )),
    );
  }
}
