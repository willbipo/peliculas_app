import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  //TODO: cambiar luego por una instancia de

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(slivers: [
      _CustomAppBar(),
      SliverList(
          delegate: SliverChildListDelegate(
        [
          _PosterAndTitle(),
          _Overview(),
          _Overview(),
          _Overview(),
          CastingCard(),
        ],
      ))
    ]));
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
            padding: EdgeInsets.only(bottom: 10),
            color: Colors.black,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: const Text(
              'movie.title',
              style: TextStyle(fontSize: 26),
            )),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: AssetImage('assets/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/no-image.jpg'),
                height: 150,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('movie.title',
                    style: Theme.of(context).textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text('movie.Originalstitle',
                    style: Theme.of(context).textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "movie.voteAverage",
                      style: textTheme.caption,
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Text(
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.justify,
          "Ipsum excepteur sunt amet id elit ut nostrud dolore ex dolore. Dolore nulla dolor dolor reprehenderit ea irure Lorem elit consequat et minim dolor dolore adipisicing. Amet esse deserunt elit anim. Mollit do sit reprehenderit labore ipsum mollit amet ex incididunt esse incididunt deserunt. Tempor velit cupidatat excepteur nostrud do ea esse. Sit eu do excepteur ex voluptate esse voluptate aliquip tempor commodo laboris. Enim deserunt et ullamco magna officia laborum anim et ipsum ipsum. Exercitation ullamco consectetur proident esse aute eiusmod anim."),
    );
  }
}
