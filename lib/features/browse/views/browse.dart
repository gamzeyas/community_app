import 'package:community_app/common/colors.dart';
import 'package:community_app/common/paths.dart';
import 'package:community_app/common/sizes.dart';
import 'package:community_app/features/widgets/appbar_with_title.dart';
import 'package:community_app/features/widgets/content_listview.dart';
import 'package:community_app/features/widgets/subtitle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: scaffoldPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWithTitle(title: "Browse"),
            const SubTitleWidget(title: "Most Viewed Articles"),
            const Expanded(flex: 3, child: ContentListView()),
            const SubTitleWidget(title: "Most Viewed Codes"),
            Expanded(
              flex: 5,
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: vertical10,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                          image: AssetImage(cardImage),
                                          fit: BoxFit.cover)),
                                ),
                              )),
                          Expanded(
                              flex: 7,
                              child: Padding(
                                padding: horizontal10,
                                child: Row(
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("For My Project Need ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: containerColor,
                                                fontWeight: FontWeight.bold)),
                                        Text("Gamze Yaş",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: greyColor,
                                            )),
                                        Text("125,908 views  •  2 days ago",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: greyColor,
                                            )),
                                      ],
                                    ),
                                    Padding(
                                      padding: horizontal15,
                                      child: CircleAvatar(
                                        backgroundColor: activeColor,
                                        child: SvgPicture.asset(
                                          bookmarkDeactiveSvg,
                                          colorFilter: const ColorFilter.mode(
                                              containerColor, BlendMode.srcIn),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
