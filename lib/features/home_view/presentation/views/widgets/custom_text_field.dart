import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.onChanged});
  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
      decoration:  InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: CustomColors.blue, width: 3.0,),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: CustomColors.blue, width: 3.0),
        ),
        hintText: hintText,
      ),
      onChanged: onChanged,
    );
  }
}
