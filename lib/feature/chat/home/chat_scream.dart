import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/feature/chat/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/feature/chat/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/feature/chat/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/feature/providers/chat_provider.dart';

class ChatScream extends StatelessWidget {
  const ChatScream({super.key});

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
                'https://i.pinimg.com/736x/5f/b4/ee/5fb4ee34ec23c23f713bb41ac0558084.jpg',
              ),
            ),
          ),
        ),
        title: const Text('Ramona Flowers'),
        centerTitle: false,
      ),
      body: _chatView(), //Esto se puede ver como un div en html
    );
  }
}

void _showImageModal(BuildContext context) {
  const double sizebox = 24;
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
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const CircularProgressIndicator(strokeWidth: 2),
                'https://i.pinimg.com/736x/5f/b4/ee/5fb4ee34ec23c23f713bb41ac0558084.jpg',
                fit: BoxFit.cover,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el modal
              },
              child: Row(
                children: [
                  const SizedBox(width: sizebox),
                  IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () async {
                      const url = 'tel:+573166427003';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('No se puede realizar la llamada'))
                        );
                      }
                    },
                  ),
                  const SizedBox(width: sizebox),
                  IconButton(
                    icon: const Icon(Icons.videocam),
                    onPressed: () {},
                  ),
                  const SizedBox(width: sizebox),
                  IconButton(
                    icon: const Icon(Icons.location_on),
                    onPressed: () {},
                  ),
                  const SizedBox(width: sizebox),
                  IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

launch(String url) {

  // TODO: implement launch
  throw UnimplementedError();

}

canLaunch(String url) {
  // TODO: implement canLaunch
  throw UnimplementedError();
}

class _chatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final mesaage = chatProvider.messageList[index];
                    return (mesaage.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: mesaage)
                        : MyMessageBubble(message: mesaage);
                  }),
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
