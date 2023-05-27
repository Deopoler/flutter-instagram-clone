import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/components/avatar_widget.dart';
import 'package:flutter_instagram_clone/src/components/image_data.dart';
import 'package:flutter_instagram_clone/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: NotificationListener(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: ListView(
          children: [
            _storyBoardList(),
            _postList(),
          ],
        ),
      ),
    );
  }

  Widget _postList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 50,
      itemBuilder: (context, index) {
        return const PostWidget();
      },
    );
  }

  Widget _storyBoardList() {
    return SizedBox(
      height: 110,
      child: NotificationListener(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _myStory();
            }
            return AvartarWidget(
              thumbPath:
                  'https://static01.nyt.com/images/2021/09/14/science/07CAT-STRIPES/07CAT-STRIPES-mediumSquareAt3X-v2.jpg',
              type: AvartarType.hasStory,
              nickName: "cat.lovers",
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }

  Widget _myStory() {
    return Stack(
      children: [
        AvartarWidget(
          thumbPath:
              'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg',
          type: AvartarType.dontHaveStory,
          nickName: "Your Story",
        ),
        Positioned(
          right: 5,
          bottom: 25,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                "+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
