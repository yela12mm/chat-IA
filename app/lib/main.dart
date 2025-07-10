
import 'package:app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:app/feature/home/presentation/bloc/home_state.dart';
import 'package:app/feature/home/presentation/views/failure.dart';
import 'package:app/feature/home/presentation/views/initial.dart';
import 'package:app/feature/home/presentation/views/loading.dart';
import 'package:app/feature/home/presentation/views/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            
            if (state is HomeLoadInitial) {
              return const InitialView();
            } else if (state is HomeLoadLoading) {
              return const LoadingView();
            } else if (state is HomeLoadSuccess) {
              return SuccessView(messages: state.messages);
            } else if (state is HomeLoadError) {
              return FailureView(message: state.error);
            }
            return const InitialView();
          },
        ),
      ),
    );
  }
} 