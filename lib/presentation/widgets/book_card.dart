import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(16),
        ),
        height: 200,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), 
                  bottomLeft: Radius.circular(16)
                ),
                child: Image.network('https://ir.ozone.ru/s3/multimedia-n/wc1000/6121637867.jpg')
              ),
            ),
            const Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chuck Palahniuk. Choke'),
                  Text('10/10', style: TextStyle(fontSize: 20),)
                ],
              ),
            )
          ],
        ),
      ),
      onTap:() {
        print(1);
      },
    );
  }
}