import 'package:equatable/equatable.dart';
import '../models/chat_model.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class HomeLoadInitial extends ChatState {}

class HomeLoadLoading extends ChatState {}

class HomeLoadSuccess extends ChatState {
  final List<Message> messages;

  const HomeLoadSuccess(this.messages);

  @override
  List<Object?> get props => [messages];
}

class HomeLoadError extends ChatState {
  final String error;

  const HomeLoadError(this.error);

  @override
  List<Object?> get props => [error];
}
