library mini_player;

import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

// ignore: must_be_immutable
class ExpandablePlayer extends StatefulWidget {
  ExpandablePlayer({
    super.key,
    required this.context,
    required this.animationController,
    this.enableBottomPadding = false,
  });

  //* Build context
  final BuildContext context;

  //* animation controller
  AnimationController animationController;

  //* enable bottom padding
  final bool enableBottomPadding;

  @override
  State<ExpandablePlayer> createState() => _ExpandablePlayerState();
}

class _ExpandablePlayerState extends State<ExpandablePlayer> {
  //
  //
  Future<bool> lo() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    //* this is the package controller provider
    final controller = ExpandablePlayerController(
      context,
      widget.animationController,
    );

    return WillPopScope(
        child: AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, _) {
              //*
              return Positioned(
                height: controller.lerp(
                  controller.minHeight,
                  controller.maxHeight,
                ),
                left: 0,
                right: 0,
                bottom: (controller.isMiniPlayer && widget.enableBottomPadding)
                    ? controller.playerCollapsedPosition()
                    : 0,
                child: GestureDetector(
                  onVerticalDragUpdate: controller.handleDragUpdate,
                  onVerticalDragEnd: controller.handleDragEnd,
                  onTap: controller.isMiniPlayer ? controller.toggle : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(controller.miniPlayerRadius)),
                    margin: EdgeInsets.symmetric(
                      horizontal: controller.widgetHorizontalMargin,
                      vertical: controller.widgetVerticalMargin,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: controller.isMiniPlayer ? 5 : 0,
                    ),
                    child: Stack(
                      children: [
                        PlayerControllersPosition(
                          controller: controller,
                          animationController: widget.animationController,
                        ),

                        //* song image meta data positioning
                        PlayerSongArtPosition(
                          controller: controller,
                          songArtWidget: const Placeholder(),
                        ),

                        //* poistion of the song description when player window is collapsed
                        MiniPlayerSongDsc(
                          controller: controller,
                        ),

                        //* player window app bar
                        PlayerAppBar(
                          controller: widget.animationController,
                          onMinimizeBtnTapped: controller.toggle,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
        onWillPop: () {
          return lo();
        });
  }
}
