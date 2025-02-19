import 'package:flutter/material.dart';

class SuitmediaCircleAvatar extends StatelessWidget {
  const SuitmediaCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 75,
      backgroundImage: NetworkImage(
        'https://avatars.githubusercontent.com/u/55399999?v=4',
      ),
    );
  }
}
