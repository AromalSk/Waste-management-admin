import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_management_admin/domain/entities/chat.dart';

Future<List<Message>> allMessages(String userId) async {
  List<Message> allChat = [];

  final snapshot = await FirebaseFirestore.instance
      .collection('chat')
      .doc(userId)
      .collection('all-message')
      .get();

  if (snapshot.docs.isNotEmpty) {
    allChat = snapshot.docs.map((data) {
      final mapContent = data.data();
      return Message.fromMap(mapContent);
    }).toList();
  }

  return allChat;
}
