import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modelo_base/bloc/realidad_aumentada_bloc.dart';
import 'package:modelo_base/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RealidadAumentadaBloc>(
            create: (_) => RealidadAumentadaBloc()),
      ],
      child: Builder(builder: (context) {
        context
            .read<RealidadAumentadaBloc>()
            .add(OnInitFirebaseRealidadAumentada());
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: HomePage(),
        );
      }),
    );
  }
}
