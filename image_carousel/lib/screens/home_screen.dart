import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        int? nextPage = pageController.page?.toInt();

        if (nextPage == null) {
          return;
        }

        if (nextPage == 4) {
          nextPage = 0;
        } else {
          nextPage++;
        }

        pageController.animateToPage(
          nextPage,
          duration: Duration(microseconds: 500),
          curve: Curves.ease
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
        body: PageView(
          controller: pageController,
          children: _assetImages(),
      )
    );
  }

  List<Image> _assetImages() {
    return [1, 2, 3, 4, 5]
        .map((number) => Image.asset('assets/image_$number.jpeg', fit: BoxFit.cover))
        .toList();
  }

  List<Image> _networkImages() {
    return [
      "https://mblogthumb-phinf.pstatic.net/MjAyNDEwMDVfMjIx/MDAxNzI4MTIzOTk0NDk0.QuN4eH0oITv8ZZaKd9N2M1-XniqqKWSvdwUs_juDTAUg.WTy9-Qrivv-dodjgNesRU2tFZjagB9rrHzGje2osaW0g.JPEG/IMG_2762.JPG?type=w800",
      "https://mblogthumb-phinf.pstatic.net/MjAyNDEwMDVfMTAy/MDAxNzI4MTIzOTk0NTE4.mPXsRq4fuijzVAdMxElP3kCzN2R7T2y4KxkYddi5rMgg.aHtbNnbjP38T0_1Qqads9IxX1sUB9fSe3j4j9B15rSMg.JPEG/IMG_2763.JPG?type=w800",
      "https://mblogthumb-phinf.pstatic.net/MjAyNDA1MTJfMTIw/MDAxNzE1NDk4MjMzMTE5.tA-a4ODYwk27EoOQAHM4b5qtao3exAPG8R0P3xeKPMMg.LfaG2I4Ns3DEgDyi9gE5UnpOQUeZiggo6W8PA20Y1bQg.JPEG/IMG_4112.JPG?type=w800",
      "https://mblogthumb-phinf.pstatic.net/MjAyNDA1MTJfMjk3/MDAxNzE1NDk4MjMxODQx.QRDqKDp68fm_f-U99DynI2Y3Y9kzBU37PDgsHwyZxmIg.FxQI7qhBQcJyDp03brwJINaX9-rvPSbhitToi37w0ckg.JPEG/IMG_4111.JPG?type=w800",
      "https://mblogthumb-phinf.pstatic.net/MjAyNDA1MTJfMTA4/MDAxNzE1NDk4MjMyNTM3.Nm15XWuqOYJ6VNYuiw81M9f01sUwaziZxieEv6HD2gUg.Iv4SXFtBzMsPGpa_8WPBCchkI6zVpdhfEq6aeU8ijOog.JPEG/IMG_4109.JPG?type=w800"
    ].map((src) => Image.network(src, fit: BoxFit.cover))
     .toList();
  }

  // TODO 시스템에 저장된 이미지 with ImagePicker

  // TODO 구글 드라이브나, 구글 포토에 있는 사진

}
