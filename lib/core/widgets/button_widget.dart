import 'package:tecnofit_test/core/core.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  const ButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.normalBlue),
                            ),
                            onPressed: onPressed,
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: AppColors.beige),
                            )),
                      );
  }
}