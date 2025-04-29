import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentListScreen extends StatelessWidget {
  const CommentListScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final _commentStream = Supabase.instance.client.from('comment_list').stream(primaryKey: ['comment_id']);
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
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
                  itemCount: comment.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // make sure the data is available in supabase and not NULL
                      title: Text(comment[index]['user_id']),
                      leading: Text(comment[index]['comment_caption']),
                    );
                  }
              );
            };
            return Text("Fetch failed");
          })
        ],
      ),
    );
  }
}