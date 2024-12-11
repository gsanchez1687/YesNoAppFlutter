import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              _showImageModal(context);
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://static.wikia.nocookie.net/skyhigh/images/5/53/Gwen.png/revision/latest/scale-to-width-down/300?cb=20141201201025&path-prefix=es',
              ),
            ),
          ),
        ),
        title: const Text('Chat'),
        centerTitle: false,
      ),
      body: _chatView(), //Esto se puede ver como un div en html
    );
  }

  // Función para mostrar el modal con la imagen
  void _showImageModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://static.wikia.nocookie.net/skyhigh/images/5/53/Gwen.png/revision/latest/scale-to-width-down/300?cb=20141201201025&path-prefix=es',
                  fit: BoxFit.cover,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el modal
                },
                child: const Text('Cerrar'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Ejemplo de widget para el cuerpo
  Widget _chatView() {
    return const Center(
      child: Text('Vista del chat'),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ChatScreen(),
  ));
}
