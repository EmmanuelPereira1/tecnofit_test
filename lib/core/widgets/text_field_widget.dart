import 'package:tecnofit_test/core/core.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? Function(String?) validator;

  const TextFieldWidget({super.key, required this.hintText, this.obscureText = false, required this.controller, required this.onChanged, required this.validator});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(  
                        obscureText: obscureText,
                        controller: controller,
                        onChanged: onChanged,
                        validator: validator,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(color: AppColors.normalBlue)),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: hintText,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      );
  }
}