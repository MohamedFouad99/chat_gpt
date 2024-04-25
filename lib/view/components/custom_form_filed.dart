import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024

// This is a class named CustomFormFiled which extends the StatelessWidget class.
// The purpose of this class is to create a custom search field widget that can
// be used in a Flutter application. The class takes in several parameters such
// as the hint text, keyboard type, controller, onSaved, onChange, onPressedSend,
// suffixIcon, hintStyle, and fillColor.
// The build method returns a TextFormField widget wrapped in a Padding and
// SizedBox widgets. The TextFormField widget takes in several parameters such as
// keyboardType, style, controller, onSaved, onChanged, textAlign, cursorColor,
// decoration and more. The decoration parameter is an instance of InputDecoration
// which has several properties such as prefixIcon, suffixIcon, contentPadding,
// fillColor, filled, hintText, hintStyle, border, enabledBorder, and focusedBorder.
// The buildBorder method returns an OutlineInputBorder widget that is used as the
// border for the search field. If a color is provided, it is used as the border
// color, otherwise the color is set to transparent.
// Overall, this class provides a reusable and customizable search field widget
// for Flutter applications.
class CustomFormFiled extends StatelessWidget {
  const CustomFormFiled({
    super.key,
    this.controller,
    this.onChange,
    this.onFieldSubmitted,
    this.onPressedSend,
  });

  final TextEditingController? controller;
  final void Function(String?)? onChange;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onPressedSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: Theme.of(context).textTheme.bodySmall,
        controller: controller,
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        textAlign: TextAlign.start,
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: onPressedSend,
              child: SvgPicture.asset('assets/icons/send_icon.svg'),
            ),
          ),
          filled: true,
          prefix: const SizedBox(
            height: 15,
          ),
          hintText: 'Write your question here..',
          hintStyle: Theme.of(context).textTheme.bodySmall,
          fillColor: Colors.grey.withOpacity(.5),
          //const Color(0xFFFFFFFF).withOpacity(.5),
          contentPadding: const EdgeInsets.all(8),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(const Color(0xFFFFFFFF).withOpacity(.5)),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white10));
}
