import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_details_controller.dart';
import '../controllers/widget_controllers/albums_container_controller.dart';

import '../widgets/text_container.dart';

class AlbumsListScreen extends StatelessWidget {
  static const route = '/albumsListScreen';

  const AlbumsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userDetailsController = Get.find<UserDetailsController>();
    final _albumsContainerController = Get.find<AlbumsContainerController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${Get.arguments['username']} albums',
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _albumsContainerController.albums.length,
        itemBuilder: (ctx, i) => TextContainer(
          title: _albumsContainerController.albums[i].title,
          onTap: () => _userDetailsController.gotoAlbumDetailsScreen(
            _albumsContainerController.albums[i].id,
            _albumsContainerController.albums[i].title,
          ),
        ),
      ),
    );
  }
}
