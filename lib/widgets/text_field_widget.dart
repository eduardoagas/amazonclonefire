import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  const TextFieldWidget(
      {Key? key,
      required this.title,
      required this.controller,
      required this.obscureText,
      required this.hintText})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusNode;
  bool isInFocus = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2, top: 4),
          child: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            isInFocus
                ? BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                : BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
          ]),
          child: TextField(
              focusNode:
                  focusNode, //get Information of states of the text field
              obscureText: widget.obscureText,
              controller: widget.controller,
              maxLines: 1,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: widget.hintText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1)))),
        )
      ],
    );
  }
}
