import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/common_size_helper.dart';

class SearchTextField extends StatelessWidget {
  final String? calledFrom;
  String? hint;
  TextEditingController? contoller;
  FocusNode? focusNode;
  bool isPassword = false;
  TextInputType? textType;
  bool enabled = true;
  bool isForTwoDecimal = false;
  bool isPrefix = false;
  FormFieldValidator? validator;
  final TextInputAction? textInputAction;
  Function(String)? onChangeFunction;
  Function(String)? onSubmitFunction;

  SearchTextField(
      this.hint,
      this.contoller,
      this.focusNode,
      this.isPassword,
      this.isPrefix,
      this.onChangeFunction,
      this.onSubmitFunction,
      this.textType, {
        required this.enabled,
        required this.isForTwoDecimal,
        this.textInputAction,
        this.calledFrom,
        this.validator
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayWidth(context) * 0.12,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? textFieldBackgroundColor
            : textFieldBackgroundColor,
        borderRadius:  BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        onTap: () {},
        autofocus: false,
        enabled: enabled,
        keyboardType: textType,
        textCapitalization: TextCapitalization.words,
        controller: contoller,
        focusNode: focusNode,
        obscureText: isPassword,
        validator: validator,
        onChanged: onChangeFunction!,
        textInputAction: textInputAction,
        style: TextStyle(
            color: Colors.black87, fontSize: displayWidth(context) * 0.035),
        decoration: InputDecoration(
          prefixIcon: calledFrom == 'reviewScreen'
              ? null
              : const Padding(
              padding: EdgeInsets.all(14.0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ) // myIcon is a 48px-wide widget.
          ),
          suffixIcon: Icon(
            Icons.filter_alt_outlined,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
          hintText: hint,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: displayWidth(context) * 0.035),

        ),
      ),
    );
  }
}
