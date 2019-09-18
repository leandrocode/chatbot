enum ChatMessageType { sent, received }

class ChatMessage {
  final String name;
  final String text;
  final String initials;
  final ChatMessageType type;

  ChatMessage({this.name, this.text, this.initials, this.type});
}
