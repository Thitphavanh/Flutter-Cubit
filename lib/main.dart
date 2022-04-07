import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit.dart';
import 'package:flutter_cubit/home_page.dart';
import 'model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      MaterialApp(
        home: BlocProvider(
          create: (context) {
            return TodoCubit(Todo());
          },
          child: Home(),
        ),
      ),
    ),
    storage: storage,
  );
}
