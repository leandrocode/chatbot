import 'package:chatbot/models/chat_message.dart';
import 'package:chatbot/widgets/chat_message_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow.dart';

class HomePage extends StatefulWidget {
   @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _messageList = <ChatMessage>[];
  final _controllerText = TextEditingController();

  
  Future _dialogflowRequest({String text}) async {
    AuthGoogle authGoogle = 
        await AuthGoogle(fileJson: 'assets/DialogFlowChatbot.credentials.json').build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle);
    AIResponse response = await dialogflow.detectIntentFromText(text);

      var message = ChatMessage(
    name: 'Bot',
    initials: 'B',
    text: response.getMessage(),
    type: ChatMessageType.received);

    setState(() {
     _messageList.insert(0, message);
    });
  }
  
Widget _buildList(){
  return Flexible(
    child: ListView.builder(
      itemCount: _messageList.length,
      itemBuilder: (_,int index) => ChatMessageListItem(
        chatMessage: _messageList[index],
      ),
      reverse: true,
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatbot")),
      body: Column(
       children: <Widget>[ _buildList(),
          Divider(height: 1),
          _buildUserInput()],
      ),
    );
  }

  Widget _buildUserInput(){
    return Container(
      color:  Colors.white,
      child: Row(
        children: <Widget>[
          Flexible(child: TextField(controller: _controllerText)),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          )
        ],
      ),
    );
  }  

void _sendMessage(){
  var message = ChatMessage(
    name: 'Kleber',
    initials: 'K',
    text: _controllerText.text,
    type: ChatMessageType.sent);

    setState(() {
     _messageList.insert(0, message);
    });

    _dialogflowRequest(text: _controllerText.text);
}





}