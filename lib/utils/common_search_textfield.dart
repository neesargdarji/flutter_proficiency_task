import 'dart:async';

import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField(
      {Key? key,
      this.clearTap,
      this.goto,
      this.clearIcon = true,
      this.applyFilter = true,
      this.onFieldSubmitted,
      this.onChanged,
      required this.controller,
      required this.text,
      this.elevation,
      this.enable = true,
      this.autofocus = false,
      this.onTap,
      this.textInputAction})
      : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String text;
  double? elevation = 3;
  final GestureTapCallback? onTap;
  final bool applyFilter;
  bool clearIcon;
  bool autofocus;
  bool enable;
  final TextInputAction? textInputAction;
  final GestureTapCallback? clearTap;
  final GestureTapCallback? goto;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  StreamController<String> streamController = StreamController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.applyFilter == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: widget.goto,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      onChanged: (value) {
                        streamController.add(value);
                      },
                      autofocus: widget.autofocus,
                      enabled: widget.enable,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      // style: const TextStyle(color: ColorRes.colorIndigo),
                      controller: widget.controller,
                      keyboardType: TextInputType.text,
                      textInputAction:
                          widget.textInputAction ?? TextInputAction.done,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          enabled: true,
                          hintStyle: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          prefixIconConstraints: const BoxConstraints(
                              maxHeight: 30,
                              maxWidth: 30,
                              minHeight: 30,
                              minWidth: 30),
                          // prefixIcon: Container(
                          //   padding: const EdgeInsetsDirectional.only(
                          //       start: 10, end: 5),
                          //   height: 30,
                          //   width: 30,
                          //   child: const CustomSvgPicture(
                          //     image: ImageRes.search,
                          //     height: 30,
                          //     color: ColorRes.colorA5,
                          //   ),
                          // ),
                          suffixIconConstraints: const BoxConstraints(
                              maxHeight: 30,
                              maxWidth: 30,
                              minHeight: 30,
                              minWidth: 30),
                          suffixIcon: widget.clearIcon
                              ? InkWell(
                                  onTap: widget.clearTap,
                                  child: Container(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 10),
                                    height: 30,
                                    width: 30,
                                    child: const Icon(
                                      Icons.clear,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              : null,
                          hintText: widget.text,
                          contentPadding: const EdgeInsetsDirectional.only(
                              start: 25, top: 5)),
                    ),
                  ),
                ),
              ),
            ],
          )
        : InkWell(
            onTap: widget.goto,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.blue, blurRadius: 2, offset: Offset(0, 1))
                  ]),
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  autofocus: widget.autofocus,
                  onTap: widget.goto,
                  onChanged: (value) {
                    streamController.add(value);
                  },
                  enabled: widget.enable,
                  style: const TextStyle(
                      // color: ColorRes.colorA5,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  controller: widget.controller,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      enabled: true,
                      hintStyle: const TextStyle(
                          // color: ColorRes.colorA5,
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                      prefixIconConstraints: const BoxConstraints(
                          maxHeight: 30,
                          maxWidth: 30,
                          minHeight: 30,
                          minWidth: 30),
                      prefixIcon: Container(
                        padding: const EdgeInsetsDirectional.only(start: 10),
                        height: 30,
                        width: 30,
                        // child: const CustomSvgPicture(
                        //   image: ImageRes.search,
                        //   height: 30,
                        //   color: ColorRes.colorA5,
                        // ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                          maxHeight: 30,
                          maxWidth: 30,
                          minHeight: 30,
                          minWidth: 30),
                      suffixIcon: widget.clearIcon
                          ? InkWell(
                              onTap: widget.clearTap,
                              child: Container(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 10),
                                height: 30,
                                width: 30,
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : null,
                      hintText: widget.text,
                      contentPadding:
                          const EdgeInsetsDirectional.only(start: 25, top: 5)),
                ),
              ),
            ),
          );
  }
}
