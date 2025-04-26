import 'package:api_clean/featers/posts/data/model/post_model.dart';
import 'package:api_clean/featers/posts/domain/use_case/update_post_use_case.dart';
import 'package:api_clean/featers/posts/presintation/cubit/delete_post_cubit.dart';
import 'package:api_clean/featers/posts/presintation/screens/update_post_screen.dart';
import 'package:api_clean/featers/posts/presintation/state/delete_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/posts_data_source.dart';
import '../../data/repositeries/post_repostory_imp.dart';
import '../cubit/Update_post_cubit.dart';
import '../cubit/get_all_post_cubit.dart';

class PostItemWidget extends StatelessWidget {
  PostModel postModel;
  int index;

  PostItemWidget({super.key, required this.postModel, required this.index}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(postModel.title),
          Text(postModel.body),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => BlocProvider(
                            create:
                                (context) => UpdatePostCubit(
                                  updatePostUseCase: UpdatePostUseCase(
                                    postRepostiry: PostRepostoryImp(
                                      remoteDataSource: PostsRemoteDataSource(),
                                    ),
                                  ),
                                ),
                            child: UpdatePostScreen(
                              post: postModel,
                              index: index,
                            ),
                          ),
                    ),
                  );
                },
                icon: Icon(Icons.edit),
              ),
              postModel.isLoading!
                  ? CircularProgressIndicator()
                  : BlocListener<DeletePostCubit, DeletePostState>(
                    listener: (context, state) {},
                    child: IconButton(
                      onPressed: () async {
                        context.read<GetAllPostCubit>().updateLoading(
                          index: index,
                        );
                        await context.read<DeletePostCubit>().deletePost(
                          id: postModel.id!,
                        );

                        context.read<GetAllPostCubit>().deletePost(
                          index: index,
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
            ],
          ),
          Divider(color: Colors.black, thickness: 1),
        ],
      ),
    );
  }
}
