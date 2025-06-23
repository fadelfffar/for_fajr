// import 'package:flutter/material.dart';
// import 'package:for_fajr/core/database/comment_model.dart';
// import 'package:for_fajr/ui/ui_widgets/primary_button.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// // passing Input data directly Supabase(immediately shows on public data)
// class NewCommentScreen extends StatefulWidget {
//   const NewCommentScreen({super.key});

//   @override
//   State<NewCommentScreen> createState() => _NewCommentScreenState();
// }

// class _NewCommentScreenState extends State<NewCommentScreen> {

//   // MasjidModel that specifies Supabase Data
//   late CommentModel data;

//   @override
//   void initState() {
//     //data model initialization as required by compiler
//     super.initState();
//     // TODO(): add Foreign Key post_id
//     data = CommentModel(commentCaption: 'Hello');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushReplacementNamed(context, '/post-list');
//       } , child: Text("Back")),
//       body: Container(
//         padding: EdgeInsets.only(left: 24, right: 24),
//         child: Column(
//           children: [
//             SizedBox(height: 80,),
//             Form(
//               child: Column(
//                 children: [
//                   Text("Add New Comment"),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Comment Caption'),
//                     onChanged: (value) {
//                       data.commentCaption = value;
//                     },
//                   ),
//                   PrimaryButton(
//                     onPressedData: () async{
//                       await Supabase.instance.client
//                         .from('comment_list')
//                         .insert({'comment_caption': data.commentCaption,});
//                     }, textButtonData: 'Comment'),
//                 ],
//               ),)
//           ],
//         ),
//       ),
//     );
//   }
// }