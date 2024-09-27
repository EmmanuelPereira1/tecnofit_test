import 'package:tecnofit_test/core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late BlocCubitLogin bloc;

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    bloc = AppGetIt.instance.get<BlocCubitLogin>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: BlocBuilder<BlocCubitLogin, BlocState>(
        bloc: bloc,
        builder: (context, state) {

          if (state is BlocSuccess){
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(
                context,
                '/home',
              );
            });
          }

          return _buildLoginForm(context);
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 SizedBox(height: screenHeight * 0.2),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    TextFieldWidget(
                      validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite o e-mail';
                              }
                              return null;
                      },
                      hintText: 'Email',
                      controller: _emailTextController,
                      onChanged: (value) => bloc.setEmail(value),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextFieldWidget(
                      hintText: 'Password',
                      validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite a senha';
                              }
                          return null;
                      },
                      controller: _passwordTextController,
                      onChanged: (value) => bloc.setPassword(value),
                      obscureText: true,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Botão de Login
                    ButtonWidget(
                      onPressed: () {
                        bloc.loginController(
                          _emailTextController.text,
                          _passwordTextController.text,
                        );
                      bloc.registerController(
                          _emailTextController.text,
                          _passwordTextController.text,
                          );
                      }, text: 'LOGIN',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   
   
}