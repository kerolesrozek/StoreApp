import 'package:flutter/material.dart';

class CusttomTextField extends StatelessWidget {
  const CusttomTextField({
    super.key,
    required this.hintText, this.onSaved,
  });
  final String hintText;
 final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        onSaved:onSaved ,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'This Failed is required';
          }
          else{
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
        ),
      ),
    );
  }
}
