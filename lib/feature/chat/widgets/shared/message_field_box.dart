//import material
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue
    });
  
  get keyboardAppearance => null;

  @override
  Widget build(BuildContext context) {

    //limpiar la caja de texto
    final textController = TextEditingController();

    //controlar el focus
    final FocusNode focusNode = FocusNode();

    //controlar el border
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    //controlar el border
    final inputDecoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      hintText: 'Enviar mensaje',
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final Textvalue = textController.value.text;//obtiene el valor de la caja de texto
          textController.clear();
          onValue(Textvalue);
        },
      ),
    );


    //retornar el widget
    return TextFormField(
      keyboardAppearance: keyboardAppearance ?? Brightness.dark,
      focusNode: focusNode,
      onTapOutside: (event){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit: $value');
        textController.clear();
        focusNode.requestFocus();
         onValue(value);
      },
    );
  }
}
