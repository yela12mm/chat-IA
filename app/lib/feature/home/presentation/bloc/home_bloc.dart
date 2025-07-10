import 'package:app/feature/home/presentation/bloc/home_event.dart';
import 'package:app/feature/home/presentation/bloc/home_state.dart';
import 'package:app/feature/model/content.dart';
import 'package:app/feature/model/serviceAPI.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';  // asegúrate de que tienes esto
import 'home_state.dart';

class ChatBloc extends Bloc<HomeEvent, ChatState> {
  final ServiceAPI apiService = ServiceAPI();
  ChatBloc() : super(HomeLoadInitial()) {
    on<SendMessageEvent>((event, emit) async {
      emit(HomeLoadLoading());
      try {      
        final reply = await apiService.sendMessage(event.message);
        final messages = [
          Message(role: 'user', content: event.message),
          Message(role: 'assistant', content: reply),
        ];
        emit(HomeLoadSuccess(messages));
      } catch (e) {
        print(" Error: $e");
        emit(HomeLoadError(e.toString()));
      }
   });
  }
}