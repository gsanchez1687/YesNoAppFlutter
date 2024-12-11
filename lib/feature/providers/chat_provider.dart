import 'package:flutter/material.dart';
import 'package:yes_no_app/config/heplers/get_yes_no_anwer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//para que sirve ChangeNotifier?
//Respuesta: sirve para que los widgets que esten escuchando este provider se actualicen
class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnwer getYesNoAnwer = GetYesNoAnwer();

  //lista de mensajes
  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me, imageUrl: 'imagen.png'),
    Message(text: 'Que tal?', fromWho: FromWho.me, imageUrl: 'imagen.png'),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me, imageUrl: 'imagen.png');
    messageList.add(newMessage);
    //actualizar la pantalla
    if(text.endsWith('?')) await herReply();
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnwer.getAnswer();
    final newMessage = herMessage;
    messageList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    Future.delayed(const Duration(milliseconds: 100), () {
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}