import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final List<Map<String, dynamic>> _friends = [];

  void _addFriend(String name) {
    setState(() {
      _friends.add({"name": name, "favorite": false});
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      _friends[index]["favorite"] = !_friends[index]["favorite"];
    });
  }

  void _removeFriend(int index) {
    setState(() {
      _friends.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Friends")),
      body: ListView.builder(
        itemCount: _friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_friends[index]["name"]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(_friends[index]["favorite"]
                      ? Icons.star
                      : Icons.star_border),
                  onPressed: () => _toggleFavorite(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _removeFriend(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController friendController = TextEditingController();
              return AlertDialog(
                title: const Text("Add Friend"),
                content: TextField(controller: friendController),
                actions: [
                  TextButton(
                    onPressed: () {
                      _addFriend(friendController.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
