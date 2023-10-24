import 'package:flutter/material.dart';
import 'package:social_app_ui/model/user_model.dart';

class BuildProfile extends StatefulWidget {
  //const BuildProfile({Key? key}) : super(key: key);
  final UserModel user;
  final Function() onPressed;

  const BuildProfile({super.key, required this.user, required this.onPressed});

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.user.location,
                  ),
                ],
              ),
            ),
            followButton(widget.user),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          widget.user.bio,
          maxLines: 3,
          style: const TextStyle(
              fontStyle: FontStyle.italic, overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(height: 12),
        const Text(
          'photos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.user.urlPhotos[index],
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: widget.user.urlPhotos.length),
        )
      ],
    );
  }

  followButton(UserModel user) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: user.isFollowing ? 50 : 100,
        height: 50,
        child: user.isFollowing ? buildUnFollow() : buildFollow(),
      ),
    );
  }

  buildFollow() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(width: 2.5, color: Colors.teal)),
      child: const Center(
        child: FittedBox(
          child: Text(
            'Follow',
            style: TextStyle(
                color: Colors.teal,
                letterSpacing: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  buildUnFollow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.teal,
      ),
      child: const Icon(Icons.people, color: Colors.white),
    );
  }
}
