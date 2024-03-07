import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session3/screens/creattask/create_task.dart';
import 'package:session3/screens/registrationpage/home_page.dart';
import 'constants/colors.dart';
import 'constants/routes.dart';
import 'controllers/tasks_provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ ChangeNotifierProvider(create: (_) => TasksProvider()), ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.secondaryColor,
          colorScheme: const ColorScheme.dark(primary: AppColors.legendColor),
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.text,
            displayColor: AppColors.text,
          ),
        ),
        routes: {
          Routes.home: (context) => const HomePage(),
          Routes.createTask: (context) => const CreateTaskPage(),
        },
      ),
    );
  }
}
