import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meleva_la/src/widgets/custom_text_field.dart';

import '../../utils/navigator_utils.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../home_module/home_screen.dart';

class ChatPage extends StatefulWidget {
  final String driver;
  final String photo;
  final String stars;

  const ChatPage({
    super.key,
    required this.driver,
    required this.photo,
    required this.stars,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: CustomAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100.0,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.black12,
            child: Row(
              children: [
                const SizedBox(width: 20.0),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        widget.photo == "1"
                            ? "assets/mocks/person_mock1.jpg"
                            : "assets/mocks/person_mock2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  widget.driver,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.tertiaryFixed,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index]; // Corrige reverso
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomChatTextField(controller: messageController),
                  ),
                  SizedBox(width: 10.0),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        messages.add(messageController.text);
                        messageController.clear();
                      });
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: theme.colorScheme.tertiary,
                      size: 34,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
