// import 'package:flutter/material.dart';
// import 'package:gif/gif.dart';
// import 'package:mavericks_dashboard/main.dart';

// class IntroVideo extends StatefulWidget {
//   const IntroVideo({super.key});

//   @override
//   State<IntroVideo> createState() => _IntroVideoState();
// }

// class _IntroVideoState extends State<IntroVideo> with TickerProviderStateMixin {
//   late final GifController controller;
//   @override
//   void initState() {
//     controller = GifController(vsync: this);
//     controller.addListener(() {
//       if (controller.isCompleted) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => const Dashboard(),
//           ),
//         );
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AspectRatio(
//         aspectRatio: 800 / 480,
//         child: Gif(
//             controller: controller,
//             autostart: Autostart.once,
//             repeat: ImageRepeat.noRepeat,
//             placeholder: (context) => const SizedBox(),
//             image: const AssetImage(
//               'assets/mavericks_logo_animated.gif',
//             )),
//       ),
//     );
//   }
// }
