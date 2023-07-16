import 'package:climate_bloc/climate_bloc/climate_bloc.dart';
import 'package:climate_bloc/climate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ClimateBlocApp());
}

class ClimateBlocApp extends StatelessWidget {
  const ClimateBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_)=> ClimateBloc(), child: ClimateScreen(),),
    );
  }
}