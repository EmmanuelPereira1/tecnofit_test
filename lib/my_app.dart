import 'package:tecnofit_test/core/core.dart';
import 'package:tecnofit_test/mobile/features/home/view/pages/home/bloc/bloc_cubit.dart';
import 'package:tecnofit_test/mobile/features/home/view/pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocCubitLogin>(
          create: (BuildContext context) => AppGetIt.instance.get<BlocCubitLogin>(),
        ),
         BlocProvider<BlocCubitUser>(
          create: (BuildContext context) => AppGetIt.instance.get<BlocCubitUser>(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) =>  const LoginPage(),
          '/home': (BuildContext context) =>  Container(),
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