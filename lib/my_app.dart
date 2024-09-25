import 'package:tecnofit_test/core/core.dart';
import 'package:tecnofit_test/mobile/features/home/view/pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocCubit>(
          create: (BuildContext context) => AppGetIt.instance.get<BlocCubit>(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) =>  LoginPage(),
          '/details': (BuildContext context) =>  Container(),
        },
        title: 'Prolog Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkBlue),
          useMaterial3: true,
        ),
      ),
    );
  }
}