import 'package:tecnofit_test/core/core.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const ButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.4,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.normalBlue),
                            ),
                            onPressed: onPressed,
                            child: Text(
                              text,
                              style: const TextStyle(color: AppColors.beige),
                            )),
                      );
  }
}