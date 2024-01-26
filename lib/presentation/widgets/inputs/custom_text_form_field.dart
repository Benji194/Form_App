import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {

  final String? label ;
  final String? hint ;
  final String? errorMessage ;
  final Function(String)? onChanged;
  final String? Function(String?)? validator ;
  final bool obscureText ;


  const CustomTextField({super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator, 
    this.obscureText=false,
  });



  @override
  Widget build(BuildContext context) {

    
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      // borderSide : BorderSide(color: colors.primary),
    );


    return TextFormField(
      onChanged: onChanged,
      validator: validator, 
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary),),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: colors.primary),),

        isDense: true,
        label: label!=null ? Text(label!) : null,
        hintText: hint,
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800),),
        errorText: errorMessage,
        focusColor: colors.primary,
        suffix: Icon(
          Icons.supervised_user_circle_outlined,
          color: colors.secondary,  
        ),
      ),
    );
  }
}