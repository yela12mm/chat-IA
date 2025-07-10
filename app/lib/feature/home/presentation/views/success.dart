import 'package:app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:app/feature/home/presentation/bloc/home_event.dart';
import 'package:app/feature/model/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SuccessView extends StatelessWidget {
  final List<Message> messages;

  const SuccessView({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255,255,190,228),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255,125,212),title: const Text("𝙲𝚑𝚊𝚝 𝙼𝚘𝚕𝚒")),
      body: Column(
        children: [  
            Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg.role == 'user';
                return Align(
                  alignment:
                   isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? const Color.fromARGB(255, 255, 246, 216) : const Color.fromARGB(255, 255, 235, 247),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg.content,
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                );
              },
            ),
          ),       
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Escribe otra pregunta...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = controller.text.trim();
                    if (text.isNotEmpty) {
                      context.read<ChatBloc>().add(SendMessageEvent(text));
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}