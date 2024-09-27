import 'package:tecnofit_test/core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocCubitLogin>(
          create: (BuildContext context) => AppGetIt.instance.get<BlocCubitLogin>(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) =>  const LoginPage(),
          '/home': (BuildContext context) =>  const HomePage(),
        },
        title: 'Tecnofit Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkBlue),
          useMaterial3: true,
        ),
      ),
    );
  }
}