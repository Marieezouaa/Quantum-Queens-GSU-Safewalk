import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  final List<String> friends;

  const InboxPage({super.key, required this.friends});

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  late List<String> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = widget.friends.map((friend) => "$friend needs a walking buddy!").toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inbox")),
      body: _notifications.isEmpty
          ? const Center(child: Text("No new notifications"))
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(_notifications[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _notifications.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
