import 'package:flutter/material.dart';
import '../../constants/colors.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  final Color textFieldColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  final Color textTypingColor;
  final List<String> items;
  String? value;
  final double? widthSize;
  final double? heightSize;
  final ValueChanged<String>? onChanged;

  CustomDropdown({
    super.key,
    required this.textFieldColor,
    required this.borderColor,
    required this.text,
    required this.textColor,
    required this.textTypingColor,
    required this.items,
    required this.value,
    this.widthSize,
    this.heightSize,
    this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.heightSize ?? 55,
      width: widget.widthSize ?? double.infinity,
      child: DropdownButtonFormField<String>(
        value: widget.value,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.textFieldColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.mainButtonsColor),
          ),
          hintText: widget.text,
          hintStyle: TextStyle(color: widget.textColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        ),
        style: TextStyle(color: widget.textTypingColor),
        onChanged: (String? newValue) {
          if (newValue != null && widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
