import 'package:flutter/material.dart';

import 'ColorsName.dart';
class contentText extends StatelessWidget {
  final String hint ;
  final String cond ;
  final String returnCond ;
  final TextEditingController controller;
   contentText({super.key,required this.hint ,required this.controller,required this.cond,required this.returnCond });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 380,
      decoration: BoxDecoration(
          color: ColorManger.white,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return returnCond;
            }
            if (!RegExp(
                cond)
                .hasMatch(value)) {
              return returnCond;
            }

            return null;
          },
          decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: ColorManger.white,
              border: UnderlineInputBorder()),
        ),
      ),
    );
  }
}
