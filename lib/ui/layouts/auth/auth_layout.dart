import 'package:flutter/material.dart';

import 'widgets/background_inv.dart';
import 'widgets/custom_title.dart';
import 'widgets/linkbar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          (size.width > 800)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),

          //Linksbar
          const LinksBar(),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: double.infinity,
          height: 700,
          child: BackgroundDnd(),
        ),
        const SizedBox(height: 20),
        const CustomTitle(),
        const SizedBox(height: 20),
        // ignore: sized_box_for_whitespace
        Container(
          width: double.infinity,
          height: 420,
          child: child,
        ),
      ],
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.white,
      child: Row(
        children: [
          //DnD background
          const Expanded(child: BackgroundDnd()),

          //Login view
          Container(
            width: size.width * 0.6,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(height: 20),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
