import 'package:commerceapp/utils/color_text_styles.dart';
import 'package:flutter/material.dart';

class CustomInputDecorator {
  static InputDecoration textFieldStyle({
    String hintText,
    TextStyle hintStyle,
    bool dense = false,
    String labelText,
    TextStyle labelStyle,
    Widget prefixIcon,
    Widget suffixIcon,
    String errorText,
    TextStyle errorStyle,
    EdgeInsetsGeometry contentPadding,
    BorderRadius borderRadius
  }) {
    return InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        isDense: dense,
        contentPadding: contentPadding,
        errorText: errorText,
        errorStyle: errorStyle,
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: kLighterGrey,
                width: 1.0,
                style: BorderStyle.solid),
            borderRadius: borderRadius
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: kLighterGrey,
                width: 1.0,
                style: BorderStyle.solid),
            borderRadius: borderRadius
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: kLighterGrey,
                width: 1.0,
                style: BorderStyle.solid),
            borderRadius: borderRadius
        )
    );
  }
}
