import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Masukkan suhu dalam celcius',
      ),
    );
  }
}
