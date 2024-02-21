import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: TextField(
          decoration: InputDecoration(
            hintText: 'Search fo a city',
            labelText: 'search',
            labelStyle: const TextStyle(color: Colors.blue), // Added labelStyle

            suffixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        )),
      ),
    );
  }
}
