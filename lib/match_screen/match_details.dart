
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final QueryDocumentSnapshot match;

  const MatchDetailsScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Text('${match['team1']} vs ${match['team2']}'),
                    Text('${match['score_team1']} : ${match['score_team2']}'),
                    Text('Time: ${match['time']}'),
                    Text('Total time: ${match['total_time']}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}