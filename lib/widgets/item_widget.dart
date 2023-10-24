import 'package:flutter/material.dart';


class ItemWidget extends StatelessWidget {
  //const ItemWidget({Key? key}) : super(key: key);
  final int count;

  final String title;

  const ItemWidget({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
