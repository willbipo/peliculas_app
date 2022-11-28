import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var hds = <String, String>{
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"
    };
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      //color: Colors.red,
      child: Swiper(
        itemCount: 10, //Numero de tarjetas
        layout: SwiperLayout.STACK, //como se despliegan las tarjetas
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        itemBuilder: (_, __) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'pelicula 1'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage("https://via.placeholder.com/300x400",
                      headers: hds),
                  fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
