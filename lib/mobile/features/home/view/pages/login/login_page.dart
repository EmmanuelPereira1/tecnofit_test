
import 'package:tecnofit_test/core/core.dart';
import 'package:tecnofit_test/core/widgets/button_widget.dart';
import 'package:tecnofit_test/core/widgets/text_button_widget.dart';
import 'package:tecnofit_test/core/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: AppColors.beige,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 130),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    TextFieldWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(),
                    TextButtonWidget(),
                  ],
                )
              ],
            ),
          ),
              ),
            ),
        ));
  }
}