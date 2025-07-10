import 'package:flutter/material.dart';


class SuccessView extends StatelessWidget {
  

  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255,255,190,228),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255,125,212),title: const Text("𝙲𝚑𝚊𝚝 𝙼𝚘𝚕𝚒")),
      body: Column(
        children: [         
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
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}