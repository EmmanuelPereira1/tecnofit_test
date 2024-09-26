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


    return Scaffold(
      backgroundColor: AppColors.beige,

      body: BlocBuilder<BlocCubitLogin, BlocState>(
        builder: (context, state) {
          if (state is BlocSuccess) {
            final user = state.entityUser;
            
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user!.data!.avatar!),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${user.data!.firstName} ${user.data!.lastName}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.data!.email!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                    bloc.logoutController();
                    Navigator.pushReplacementNamed(context, '/');
                    },  
                    child: const Text('Logout'),
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
