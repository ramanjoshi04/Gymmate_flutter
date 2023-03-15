import 'package:ai_rdio/components/roundDesign.dart';
import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  const InputBox(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.controller,
      required this.hide})
      : super(key: key);

  final IconData icon;
  final String hint;
  final bool hide;
  final TextEditingController controller;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: RoundDesign(
        child: TextFormField(
            showCursor: true,
            obscureText: widget.hide,
            controller: widget.controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Empty field';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                hintText: widget.hint,
                icon: Icon(widget.icon,
                    color: Color.fromARGB(255, 183, 134, 228)),
                border: InputBorder.none)),
      ),
    );
  }
}
