import 'dart:async';

import 'package:flutter/material.dart';

class NewsSearchInputField extends StatelessWidget {
  NewsSearchInputField({super.key, required this.onChanged, required this.searchController});

  final Function(String) onChanged;
  Timer? timer;
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if(timer != null && timer!.isActive) timer!.cancel();
        timer = Timer(
          const Duration(seconds: 2),
          () {
            onChanged(value);
          },
        );
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        if(timer != null && timer!.isActive) timer!.cancel();
        onChanged(value);
      },
      decoration: InputDecoration(
        hintText: "Search News",
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade100,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
