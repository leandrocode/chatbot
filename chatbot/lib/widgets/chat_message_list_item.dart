import 'package:chatbot/models/chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {
  
  final ChatMessage chatMessage;

  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
    ? _showSentMessage()
    : _showReceivedMessage();
  }

  Widget _showSentMessage(){
    return ListTile(
      title: Text(chatMessage.name, textAlign: TextAlign.right,),
      subtitle: Text(chatMessage.text, textAlign: TextAlign.right,),
      trailing: CircleAvatar(child: Text(chatMessage.initials)),
      contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
    );
  }

  Widget _showReceivedMessage(){
    return ListTile(
      title: Text(chatMessage.name, textAlign: TextAlign.right,),
      subtitle: Text(chatMessage.text, textAlign: TextAlign.right,),
      leading: CircleAvatar(child: Text(chatMessage.initials)),
      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
    );
  }
}