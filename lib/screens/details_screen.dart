import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  //TODO: cambiar luego por una instancia de

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
            color: Colors.black,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: const Text(
              'movie.title',
              style: TextStyle(fontSize: 26),
            )),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/518097-background-hd.jpg/640px-518097-background-hd.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
