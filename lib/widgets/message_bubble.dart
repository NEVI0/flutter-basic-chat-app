import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String sender;

  final bool isFromCurrentUser;

  const MessageBubble(
      {super.key,
      required this.message,
      required this.sender,
      required this.isFromCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: isFromCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Material(
              elevation: 5,
              color: isFromCurrentUser ? Colors.lightBlueAccent : Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(50),
                  topRight: const Radius.circular(50),
                  bottomLeft: isFromCurrentUser
                      ? const Radius.circular(50)
                      : const Radius.circular(0),
                  bottomRight: isFromCurrentUser
                      ? const Radius.circular(0)
                      : const Radius.circular(50)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Text(
                  message,
                  style: TextStyle(
                      color: isFromCurrentUser ? Colors.white : Colors.black87,
                      fontSize: 16),
                ),
              )),
          const SizedBox(
            height: 4,
          ),
          Text(
            sender,
            style: const TextStyle(fontSize: 12, color: Colors.black45),
          )
        ],
      ),
    );
  }
}
