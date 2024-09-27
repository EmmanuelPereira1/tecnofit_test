import 'package:tecnofit_test/core/core.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BlocCubitLogin bloc;

   @override
  void initState() {
    bloc = AppGetIt.instance.get<BlocCubitLogin>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.beige,

      body: BlocBuilder<BlocCubitLogin, BlocState>(
        builder: (context, state) {

          
          if (state is BlocSuccess) {
            final user = state.entityUser;
            if (user == null) {
              return const Center(child: CircularProgressIndicator());
              }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(user.data!.avatar!),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    '${user.data!.firstName} ${user.data!.lastName}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    user.data!.email!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ButtonWidget(
                    onPressed: () {
                    bloc.logoutController();
                    Navigator.pushReplacementNamed(context, '/');                    
                    },
                    text: 'Logout',
                  ),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
