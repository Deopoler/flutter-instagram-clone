import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvartarType { hasStory, dontHaveStory, post }

class AvartarWidget extends StatelessWidget {
  bool? hasStory;
  String thumbPath;
  String nickName;
  AvartarType type;
  double size;
  AvartarWidget({
    super.key,
    this.hasStory,
    required this.thumbPath,
    required this.nickName,
    required this.type,
    this.size = 65,
  });

  Widget _hasStoryWidget() {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          _hasStoryAvartarImage(),
          const SizedBox(height: 7),
          Text(
            nickName,
            style: const TextStyle(color: Colors.black87, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _dontHaveStoryWidget() {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          _dontHaveStoryAvartarImage(),
          const SizedBox(height: 7),
          Text(
            nickName,
            style: const TextStyle(color: Colors.black87, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _postWidget() {
    return Row(
      children: [
        _hasStoryAvartarImage(),
        const SizedBox(
          width: 10,
        ),
        Text(
          nickName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    );
  }

  Widget _hasStoryAvartarImage() {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.orange,
          ],
        ),
      ),
      child: _avatarImage(),
    );
  }

  Widget _dontHaveStoryAvartarImage() {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: _avatarImage(),
    );
  }

  Widget _avatarImage() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: SizedBox(
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvartarType.hasStory:
        return _hasStoryWidget();
      case AvartarType.dontHaveStory:
        return _dontHaveStoryWidget();
      case AvartarType.post:
        return _postWidget();
    }
  }
}
