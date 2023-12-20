import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'match_details.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Match List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('matches').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var matches = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                var match = matches[index];
                return Card(
                  child: ListTile(
                    title: Text('${match['team1']} vs ${match['team2']}'),
                    trailing: const Icon(Icons.arrow_circle_right_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MatchDetailsScreen(match: match),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}