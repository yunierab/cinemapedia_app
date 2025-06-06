import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessageStream() {
    final messages = <String>[
      "Estamos comenzando",
      "Preparando la información",
      "Instalando dependencias",
      "Sincronizando con el servidor",
      "Esto está tardando un poco",
    ];
    return Stream.periodic(const Duration(milliseconds: 2000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Cargando..."),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessageStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Espere por favor...");
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
