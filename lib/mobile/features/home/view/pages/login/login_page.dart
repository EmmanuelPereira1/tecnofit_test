
import 'package:tecnofit_test/core/core.dart';
import 'package:tecnofit_test/core/widgets/button_widget.dart';
import 'package:tecnofit_test/core/widgets/text_button_widget.dart';
import 'package:tecnofit_test/core/widgets/text_field_widget.dart';

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
          if (state is BlocLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (state is BlocError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Erro ao realizar login. Tente novamente.'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => bloc.loginController(
                      _emailTextController.text.trim(),
                      _passwordTextController.text,
                    ),
                    child: const Text('Tentar Novamente'),
                  ),
                ],
              ),
            );
          }

          if (state is BlocSuccess){
            // Navega para a página de perfil
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
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 130),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40),
                    // Campo de Email
                    TextFieldWidget(
                      hintText: 'Email',
                      controller: _emailTextController,
                      onChanged: (value) => bloc.setEmail(value),
                    ),
                    const SizedBox(height: 20),
                    // Campo de Senha
                    TextFieldWidget(
                      hintText: 'Password',
                      controller: _passwordTextController,
                      onChanged: (value) => bloc.setPassword(value),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
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
                      },
                    ),
                    const SizedBox(height: 10),
                    // Botão Textual (Esqueci a Senha)
                    const TextButtonWidget(
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