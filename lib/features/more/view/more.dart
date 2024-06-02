// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_app/features/auth/views/sign_in.dart';
import 'package:community_app/features/more/controller/more_controller.dart';
import 'package:community_app/features/more/view/write_article.dart';
import 'package:community_app/features/widgets/menu_item.dart';
import 'package:community_app/features/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:community_app/common/colors.dart';
import 'package:community_app/common/paths.dart';
import 'package:community_app/common/sizes.dart';

class More extends ConsumerWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: ref.read(moreControllerProvider).getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userModel = snapshot.data!;
            return SafeArea(
                child: Padding(
              padding: scaffoldPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "More",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: containerColor),
                      ),
                      Padding(
                        padding: vertical10,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: CachedNetworkImageProvider(
                              userModel.profilePhoto!),
                        ),
                      )
                    ],
                  ),
                  const SubTitleWidget(
                    title: "Create Content",
                  ),
                  MenuItem(
                    title: "Write an article!",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const WriteArticle()));
                    },
                    leadingAsset: article,
                  ),
                  MenuItem(
                    title: "Let's try the coding page!",
                    onTap: () {},
                    leadingAsset: code,
                  ),
                  MenuItem(
                    title: "Your articles",
                    onTap: () {},
                    leadingAsset: article,
                  ),
                  MenuItem(
                    title: "Your code repos",
                    onTap: () {},
                    leadingAsset: code,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SubTitleWidget(title: "Profile"),
                  MenuItem(
                    title: "Edit your profile",
                    onTap: () {},
                    leadingAsset: edit,
                  ),
                  MenuItem(
                    title: "Sign out",
                    onTap: () {
                      ref.read(moreControllerProvider).signOut().whenComplete(
                          () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => const SignIn()),
                              (route) => false));
                    },
                    leadingAsset: signout,
                  ),
                ],
              ),
            ));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else
            return const Center(
              child: Text("Error"),
            );
        },
      ),
    );
  }
}
