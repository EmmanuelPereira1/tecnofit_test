import 'package:tecnofit_test/core/core.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  const TextFieldWidget({super.key, required this.hintText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return  TextField(  
                        obscureText: obscureText,
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