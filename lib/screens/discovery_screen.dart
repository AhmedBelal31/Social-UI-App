import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../model/user_model.dart';
import '../widgets/build_profile.dart';
import '../widgets/item_widget.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  int index = 0;

  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: 400,
        minHeight: 150,
        parallaxOffset: 0.5,
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        controller: panelController,
        parallaxEnabled: true,
        body: PageView.builder(
          itemBuilder: (context, index) => Image.asset(
            users[index].urlImage,
            fit: BoxFit.cover,
          ),
          itemCount: users.length,
          onPageChanged: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
        panelBuilder: (ScrollController scroll) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemWidget(
                      count: users[index].countFollowers, title: 'Followers'),
                  ItemWidget(count: users[index].countPosts, title: 'Posts'),
                  ItemWidget(
                      count: users[index].countFollowing, title: 'Following'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: BuildProfile(
                    user: users[index],
                    onPressed: () {
                      setState(() {
                        users[index].isFollowing = !users[index].isFollowing;
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          backgroundColor: Colors.teal.shade500,
          items: const [
            Icon(
              Icons.map,
              size: 30,
            ),
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.people,
              size: 30,
            ),
          ]),
    );
  }
}
