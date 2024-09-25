import 'package:tecnofit_test/core/core.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Container()));
                          },
                          child: const Text(
                            "Don't have an account?",
                            style: TextStyle(color: AppColors.normalBlue),
                          ));
  }
}