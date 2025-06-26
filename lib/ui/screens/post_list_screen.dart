import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final TextEditingController _controller = TextEditingController();
  String _audience = 'Public';
  int _maxChars = 280;
  // TODO(): is comments used or not
    List<dynamic> comments = [];
    final _postStream = Supabase.instance.client.from('post_test').stream(primaryKey: ['id']);
    // Select
    final _commentStreamCount = Supabase.instance.client.rpc('retrieve_comment');
    final _commentStream = Supabase.instance.client.from('comment_list').select('comment_caption');
    // TODO(): investigate why there is a back button on almost every appbar

  bool get _canPost => _controller.text.trim().isNotEmpty && _controller.text.length <= _maxChars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('New Post'),
        actions: [
          TextButton(
            onPressed: _canPost ? () {} : null,
            child: const Text('Post'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 16),
                const SizedBox(width: 8),
                const Text('@yourhandle', style: TextStyle(fontWeight: FontWeight.w600)),
                const Spacer(),
                DropdownButton<String>(
                  value: _audience,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: 'Public', child: Text('Public')),
                    DropdownMenuItem(value: 'Friends', child: Text('Friends')),
                    DropdownMenuItem(value: 'Private', child: Text('Private')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _audience = value);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _controller,
                maxLines: null,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  hintText: "What's on your mind?",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(icon: const Icon(Icons.format_bold), onPressed: () {}),
                IconButton(icon: const Icon(Icons.format_italic), onPressed: () {}),
                IconButton(icon: const Icon(Icons.link), onPressed: () {}),
                IconButton(icon: const Icon(Icons.tag), onPressed: () {}),
                IconButton(icon: const Icon(Icons.alternate_email), onPressed: () {}),
              ],
            ),
            const Divider(),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(vertical: 8),
            //       child: Text(
            //         _controller.text,
            //         style: const TextStyle(fontSize: 16),
            //       ),
            //     ),
            //   ),
            // ),
            StreamBuilder(
              stream: _postStream,
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
                      // TODO(): Figure out how to show different index
                      return Text(comment[index+1]['comment_caption']
                );
                }
                );
              }
              return Text("Fetch failed");
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_controller.text.length}/$_maxChars',
                  style: TextStyle(
                    color: _controller.text.length > _maxChars ? Colors.red : Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.insert_emoticon), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.schedule), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.delete), onPressed: () {
                      setState(() {
                        _controller.clear();
                      });
                    }),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
