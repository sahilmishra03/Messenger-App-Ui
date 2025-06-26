import 'dart:io';
import 'package:flutter/material.dart';

Icon getAdaptiveIcon(IconData materialIcon, IconData cupertinoIcon) {
  return Icon(Platform.isIOS ? cupertinoIcon : materialIcon);
}

class Home extends StatelessWidget {
  const Home({super.key});

  final List<Map<String, String>> users = const [
    {'name': 'Emma', 'message': "Call me when you're free."},
    {'name': 'Liam', 'message': "What's your weekend plan?"},
    {'name': 'Olivia', 'message': "Check out this new app!"},
    {'name': 'Noah', 'message': "What's your weekend plan?"},
    {'name': 'Ava', 'message': "Don't forget the meeting tomorrow."},
    {'name': 'Elijah', 'message': "Check out this new app!"},
    {'name': 'Sophia', 'message': "Let's catch up soon!"},
    {'name': 'Lucas', 'message': "Call me when you're free."},
    {'name': 'Mia', 'message': "Let's catch up soon!"},
    {'name': 'Ethan', 'message': "Call me when you're free."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
            ),
            Text(
              "Chats",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                filled: true,
                fillColor: Color(0x0D000000), // #0000000D
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),

            // "Add Story" + User Avatars
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // Add Story
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/150?img=12',
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(2),
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.add,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Your Story',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Users
                  ...List.generate(users.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/150?img=${index + 1}',
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            users[index]['name']!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Chat List
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=${index + 1}',
                      ),
                    ),
                    title: Text(
                      users[index]['name']!,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      users[index]['message']!,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: Text('10:30 AM'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // handle tab change
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Navigate',
          ),
        ],
      ),
    );
  }
}
