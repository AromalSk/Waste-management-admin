import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_management_admin/presentation/bloc/collection_schedule/collection_schedule_bloc.dart';
import 'package:waste_management_admin/presentation/bloc/gender/gender_bloc.dart';
import 'package:waste_management_admin/presentation/bloc/login/login_bloc.dart';
import 'package:waste_management_admin/presentation/bloc/spalshscreen/splashscreen_bloc.dart';
import 'package:waste_management_admin/presentation/screen/authentication/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashscreenBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => GenderBloc()),
        BlocProvider(create: (context) => CollectionScheduleBloc())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen()),
    );
  }
}
