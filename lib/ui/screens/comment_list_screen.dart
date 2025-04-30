import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentListScreen extends StatelessWidget {
  const CommentListScreen({super.key, required this.id});
  
  final int id;

  @override
  Widget build(BuildContext context) {
    final _commentStream = Supabase.instance.client.from('comment_list').stream(primaryKey: ['comment_id']);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Text("Comment List"),
            // TODO: Fix StreamBuilder
            StreamBuilder(
              stream: _commentStream,
              builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              } else if(snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                final comment = snapshot.data!;
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        // make sure the data is available in supabase and not NULL
                        title: Text("test"),
                        leading: Text(comment[index]['comment_caption']),
                      );
                    }
                );
              };
              return Text("Fetch failed");
            })
          ],
        ),
      ),
    );
  }
}