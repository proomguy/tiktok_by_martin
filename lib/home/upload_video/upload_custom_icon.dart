import 'package:flutter/material.dart';

class UploadCustomIcon extends StatelessWidget {
  const UploadCustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 32,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 12),
            width: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(256, 250, 46, 108),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(256, 32, 212, 235),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
