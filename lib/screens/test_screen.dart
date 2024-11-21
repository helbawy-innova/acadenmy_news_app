import 'package:base/app/widgets/fields/date_input_field.dart';
import 'package:base/app/widgets/fields/image_input_field.dart';
import 'package:flutter/material.dart';

import '../app/models/select_option.dart';
import '../app/widgets/fields/file_input_field.dart';
import '../app/widgets/fields/multic_select_input_field.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateInputField(
              label: "Birth Date",
              hint: "Select Birth Date",
              onDateSelected: (date) {
                print(date);
              },
            ),
            const SizedBox(height: 16),
            ImageInputField(
              label: "Profile Picture",
            ),
            FileInputField(
              label: "National ID Attachment",
            ),
            MultiSelectInputField(
              label: "Addresses",
              hint: "Select Addresses",
              valueSet: [
                SelectOption("1", "Dhaka"),
                SelectOption("2", "Chittagong"),
                SelectOption("3", "Sylhet"),
                SelectOption("4", "Rajshahi"),
                SelectOption("5", "Khulna"),
              ],
              onSelect: (date) {
                print(date);
              },
            ),
          ],
        ),
      ),
    );
  }
}
