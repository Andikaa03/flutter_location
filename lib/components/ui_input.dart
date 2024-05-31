import 'package:flutter/material.dart';

class UiInput extends StatefulWidget { // Ubah dari _UiInput
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final bool disabled;
  final bool isPassword;
  final BorderSide borderSide;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const UiInput({
    super.key,
    this.controller,
    this.labelText = 'Label',
    this.hintText = 'Masukan label',
    this.disabled = false,
    this.isPassword = false,
    this.borderSide = const BorderSide(color: Colors.black, width: 1.0),
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  UiInputState createState() => UiInputState();
}

class UiInputState extends State<UiInput> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: widget.borderSide,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      enabled: !widget.disabled,
    );
  }
}
