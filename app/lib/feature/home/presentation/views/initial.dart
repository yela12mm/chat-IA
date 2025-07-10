import 'package:app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:app/feature/home/presentation/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InitialView extends StatelessWidget {
  
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 190, 228),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 125, 212),
        title: const Text("𝙲𝚑𝚊𝚝 𝙼𝚘𝚕𝚒 ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "𝙱𝚒𝚎𝚗𝚟𝚎𝚗𝚒𝚍𝚘 𝚊 𝙲𝚑𝚊𝚝 𝙼𝚘𝚕𝚒",
              style: TextStyle(
                fontSize: 20, 

              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 120),
            SizedBox(
              width: 350,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Escribe tu pregunta...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  context.read<ChatBloc>().add(SendMessageEvent(text));
                  controller.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 248, 57, 207), 
                foregroundColor: Colors.black, 
              ),
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}