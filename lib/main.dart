import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Extract Widget"),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: 100,
          itemBuilder: (context, index) => ChatItems(
            imageUrl: faker.image.image(random: true, height: 100, width: 100),
            title: faker.person.name(),
            subtitle: faker.lorem.sentence(),
            date: faker.date.justTime().toString(),
          ),
        ),
      ),
    );
  }
}

class ChatItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String date;

  const ChatItems({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle, required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(date),
    );
  }
}
