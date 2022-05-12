import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldContainer extends StatelessWidget {
  final String label;
  final int lengthValue;
  final int? maxLineValue;
  final IconData iconData;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter>? textFormat;
  final bool isFieldRequired;

  const TextFieldContainer(
      {Key? key,
      this.textFormat,
      required this.controller,
      required this.keyboardType,
      required this.label,
      required this.iconData,
      required this.lengthValue,
      required this.onChanged,
      this.maxLineValue = 1,
      this.isFieldRequired = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
          return value!.isEmpty&&isFieldRequired ? 'This field is required' : null;
      },
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          prefixIcon: Icon(iconData),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.pinkAccent,
                  ),
                  onPressed: () => controller.clear())
              : null),
      keyboardType: keyboardType,
      maxLength: lengthValue,
      onChanged: onChanged,
      maxLines: maxLineValue,
    );
  }
}
