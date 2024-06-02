import 'package:community_app/common/colors.dart';
import 'package:community_app/common/paths.dart';
import 'package:community_app/common/sizes.dart';
import 'package:flutter/material.dart';

class ContentListView extends StatelessWidget {
  const ContentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: right5,
          child: AspectRatio(
            aspectRatio: 16 / 11,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: blueColor,
                  image: const DecorationImage(
                      image: AssetImage(cardImage),
                      fit: BoxFit.cover)),
              child: Row(
                children: [
                  const Expanded(
                      child: Padding(
                    padding: scaffoldPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Prepare for your first skateboard jump",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: containerColor),
                        ),
                        Text("Gamze Yaş",
                            style: TextStyle(
                              fontSize: 14,
                              color: containerColor,
                            )),
                        Text("125,908 views ",
                            style: TextStyle(
                              fontSize: 13,
                              color: containerColor,
                            )),
                        Text("2 days ago ",
                            style: TextStyle(
                              fontSize: 13,
                              color: containerColor,
                            ))
                      ],
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: all10,
                    child: AspectRatio(
                      aspectRatio: 10 / 16,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: blueColor,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
