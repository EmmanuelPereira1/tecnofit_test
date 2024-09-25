import 'package:flutter/material.dart';
import 'package:tecnofit_test/core/core.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(color: AppColors.normalBlue)),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      );
  }
}