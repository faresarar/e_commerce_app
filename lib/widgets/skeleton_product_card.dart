import 'package:flutter/material.dart';

class SkeletonProductCard extends StatelessWidget {
  const SkeletonProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          spacing: 8,
          children: [
            Container(
              width: 150,
              height: 20,
              color: Colors.grey[300],
            ),
            SizedBox(height: 8),
            Container(
              width: 100,
              height: 20,
              color: Colors.grey[300],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  width: 58,
                  height: 16,
                  color: Colors.grey[300],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
