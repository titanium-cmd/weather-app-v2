import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(22),
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.location_on),
                Text(
                  'Accra, Ghana',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '20-Sep-22',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 29,
            ),
            const Text(
              'News Daily',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const NewsCard(),
            const SizedBox(
              height: 27,
            ),
            const NewsCard(),
            const SizedBox(
              height: 27,
            ),
            const NewsCard(),
            const SizedBox(
              height: 27,
            ),
            const NewsCard(),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 20, top: 8, bottom: 8),
        child: Row(
          children: [
            Image.asset('assets/news_img.png'),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Animal Scientist Discovers:',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text(
                    "Researchers from the University of All Knowing have discovered a new way the breed farm animals.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey[600]!),
                  ),
                  const SizedBox(height: 21),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Thur 09 2022',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.bookmark,
                        size: 14,
                        color: Color.fromARGB(184, 141, 187, 255),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
