import 'package:flutter/material.dart';

class SupportTktTBtn extends StatelessWidget {
  const SupportTktTBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Text("Description"),
            ],
          ),
          TextFormField(
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Value';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Description",
              filled: true,
              fillColor: Colors.white,
              labelStyle: const TextStyle(color: Colors.black12),
              hintStyle: const TextStyle(color: Colors.black45),
              contentPadding: const EdgeInsets.all(
                  8.0), // Use 8.0 instead of defaultPadding
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Text("Solution"),
            ],
          ),
          TextFormField(
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Value';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Solution",
              filled: true,
              fillColor: Colors.white,
              labelStyle: const TextStyle(color: Colors.black12),
              hintStyle: const TextStyle(color: Colors.black45),
              contentPadding: const EdgeInsets.all(
                  8.0), // Use 8.0 instead of defaultPadding
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Go Back"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
