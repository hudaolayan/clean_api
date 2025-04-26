import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';
import '../cubit/Update_post_cubit.dart';
import '../cubit/get_all_post_cubit.dart';
import '../state/update_post_state.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class UpdatePostScreen extends StatelessWidget {
  PostModel post;
  int index;

  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  UpdatePostScreen({super.key, required this.post,required this.index}) {
    titleTextEditingController.text = post.title;
    bodyTextEditingController.text = post.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextField(
                textEditingController: titleTextEditingController,
                label: "Title",
                hintText: "please enter title",
                prefixIcon: Icon(Icons.title),
              ),
              SizedBox(height: 20),
              CustomTextField(
                textEditingController: bodyTextEditingController,
                label: "Body",
                hintText: "please enter body",
                prefixIcon: Icon(Icons.content_paste),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocListener<UpdatePostCubit, UpdatePostState>(
        listener: (context, state) {
          if (state is UpdatePostStateSuccess) {
            context.read<GetAllPostCubit>().updatePost(postModel: state.post,index: index);
            Navigator.pop(context);
          }

          if (state is UpdatePostStateError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (context, state) {
            if (state is UpdatePostStateLoading) {
              return Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              );
            } else {
              return CustomButton(
                text: "Update",
                onTap: () {
                  context.read<UpdatePostCubit>().updatePost(
                    title: titleTextEditingController.text,
                    body: bodyTextEditingController.text,
                    userId: 1,
                    id:post.id!,
                    index: index
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
