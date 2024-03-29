import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/common_size_helper.dart';


//Custom text field
class CommonTextField extends StatefulWidget {
  bool? isMultilineField;
  TextEditingController? controller;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  TextCapitalization? textCapitalization;
  int? maxLength;
  int? maxLines;
  IconData? prefixIcon;
  Widget? suffixIcon;
  String? labelText;
  String? hintText;
  String? suffixText;
  FocusNode? requestFocusNode;
  bool? obscureText;
  bool? readOnly;
  Function? onSuffixIconTap;
  FormFieldValidator<String>? validator;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  Function(String)? onSaved;
  Function()? onTap;
  FilteringTextInputFormatter? inputFormatter;
  // GlobalKey<FormFieldState>? formFieldKey;

  CommonTextField(
      {Key? key,
        this.controller,
        this.focusNode,
        this.textInputAction,
        this.textInputType,
        this.textCapitalization,
        this.maxLength,
        this.maxLines,
        this.prefixIcon,
        this.suffixIcon,
        this.labelText,
        this.hintText,
        this.suffixText,
        this.requestFocusNode,
        this.obscureText,
        this.readOnly = false,
        this.validator,
        this.onSuffixIconTap,
        this.onChanged,
        this.onFieldSubmitted,
        this.onSaved,
        this.onTap,
        this.inputFormatter,
        this.isMultilineField
        //this.formFieldKey
      })
      : super(key: key);

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool? obscureText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      obscureText = widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        //key: widget.formFieldKey,
          onTap: widget.onTap!,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          autofocus: false,
          readOnly: widget.readOnly!,
          focusNode: widget.focusNode,
          controller: widget.controller,
          textCapitalization: widget.textCapitalization!,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines,
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.maxLength),
            if (widget.textInputType == TextInputType.number)
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            if (widget.textInputType == TextInputType.number)
              FilteringTextInputFormatter.digitsOnly
          ],
          //maxLength: widget.maxLength,
          obscureText: obscureText!,
          obscuringCharacter: '*',
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: !widget.isMultilineField! ? EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05) : EdgeInsets.only(left: displayWidth(context) * 0.05,top: displayWidth(context) * 0.06),
            filled: true,
            alignLabelWithHint: true,
            fillColor: textFieldBackgroundColor,
            hintText: widget.hintText,
            labelText: widget.labelText,
            suffixText: widget.suffixText,
            hintStyle: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.grey,
                fontSize: displayWidth(context) * 0.04,
                fontFamily: "Inter"),
            labelStyle: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : textFieldHintColor,
                fontSize: displayWidth(context) * 0.035,
                fontWeight: FontWeight.w200,
                fontFamily: "Inter"),
            suffixStyle: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : Colors.grey[500],
                fontSize: displayWidth(context) * 0.04,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter"),
            prefixIcon: widget.prefixIcon == null
                ? null
                : Icon(
              widget.prefixIcon,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey
                  : Colors.grey,
            ),
            suffixIcon: widget.suffixIcon == null
                ? widget.obscureText!
                ? InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText!;
                });
              },
              child: Icon(
                obscureText!
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            )
                : null
                : widget.suffixIcon,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: Colors.red.shade300.withOpacity(0.7)),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            errorStyle: TextStyle(fontSize: displayWidth(context) * 0.03),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Colors.red.shade300.withOpacity(0.7)),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
          ),
          onFieldSubmitted: (value) {
            /*if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!(value);
            }*/
            FocusScope.of(context).requestFocus(widget.requestFocusNode);
          },
          style: TextStyle(
              fontSize: displayWidth(context) * 0.04,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontFamily: ""),
          validator: widget.validator),
    );
  }
}
