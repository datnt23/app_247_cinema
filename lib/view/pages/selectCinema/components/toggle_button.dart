
import 'package:flutter/material.dart';

import '../../../../src/config/app_color.dart';
import '../../../../src/models/movie.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  TicketStates ticketStates = TicketStates.idle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              ticketStates = ticketStates == TicketStates.idle
                  ? TicketStates.active
                  : TicketStates.idle;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ticketStates == TicketStates.idle
                  ? DarkTheme.greyBackground
                  : DarkTheme.blueMain,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
