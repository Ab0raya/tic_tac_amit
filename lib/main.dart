import 'package:flutter/material.dart';
import 'package:tic_tac/core/utils/assets_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_router.dart';
import 'features/home_view/presentation/controller/add_names_cubit/add_names_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AddNamesCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: Fonts.patchyRobotsFont,
        ),
        routerConfig:AppRouter.router ,
      ),
    );
  }
}

