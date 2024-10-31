import 'package:flutter/material.dart';
import 'ColorsName.dart';

class PersonRow extends StatelessWidget {
  final String name;
  final IconData nameIcon;

  const PersonRow({super.key, required this.name, required this.nameIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 400,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorManger.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Icon(
                nameIcon,
                textDirection: TextDirection.rtl,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
