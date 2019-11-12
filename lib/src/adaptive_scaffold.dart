import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveScaffold extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget title;
  final Widget body;
  final List<Widget> actions;
  final Widget appBar;
  final CupertinoNavigationBar cupertinoNavigationBar;

  final bool largeCupertino;

  AdaptiveScaffold(
      {this.scaffoldKey,
      this.title,
      @required this.body,
      this.actions,
      this.appBar,
      this.cupertinoNavigationBar})
      : largeCupertino = false;

  AdaptiveScaffold.large(
      {this.scaffoldKey,
      this.title,
      @required this.body,
      this.actions,
      this.appBar,
      this.cupertinoNavigationBar})
      : largeCupertino = true;

  @override
  _AdaptiveScaffoldState createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? Scaffold(
            key: widget.scaffoldKey,
            appBar: widget.title == null && widget.appBar == null
                ? null
                : widget.appBar ??
                    AppBar(
                      title: widget.title,
                      actions: widget.actions,
                    ),
            body: widget.body,
          )
        : CupertinoPageScaffold(
            key: widget.scaffoldKey,
            navigationBar:
                widget.title == null && widget.cupertinoNavigationBar == null
                    ? null
                    : widget.cupertinoNavigationBar ??
                        CupertinoNavigationBar(
                          middle: widget.title,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.actions ?? [],
                          ),
                        ),
            child: SafeArea(
              child: widget.largeCupertino
                  ? CustomScrollView(
                      slivers: <Widget>[
                        CupertinoSliverNavigationBar(
                          largeTitle: widget.title,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.actions ?? [],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: widget.body,
                        ),
                      ],
                    )
                  : widget.body,
            ),
          );
  }
}
