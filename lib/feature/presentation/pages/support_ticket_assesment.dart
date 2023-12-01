import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suja_shoie_app/constant/utils/theme_styles.dart';
import 'package:suja_shoie_app/feature/presentation/providers/theme_providers.dart';

import '../widget/checklist_details/take_photo.dart';

class SupportTicketAssesmentForm extends StatefulWidget {
  const SupportTicketAssesmentForm({super.key});

  @override
  State<SupportTicketAssesmentForm> createState() =>
      _SupportTicketAssesmentFormState();
}

class _SupportTicketAssesmentFormState
    extends State<SupportTicketAssesmentForm> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final FocusNode assetFocusNode = FocusNode();
  final FocusNode assetnameFoucusNode = FocusNode();
  final FocusNode decriptionFocusNode = FocusNode();
  final TextEditingController assetEditingController = TextEditingController();
  final TextEditingController assetNameEditingController =
      TextEditingController();
  final TextEditingController descriptionEditingController =
      TextEditingController();
  // final TextEditingController assetEditiingController = TextEditingController();
  // final TextEditingController assetEditiingController = TextEditingController();
  List<bool> isSelect = [true, false, false, false];
  List<bool> isCrticality = [
    true,
    false,
    false
  ]; // Initialize the isSelected list with the same length as children

  String dropdownValue = "Select Value";
  String problemDrodownValue = "Select Value";
  var problemIdentify = ["Select Value", "it's not working ", "Oil Leakgage"];

  var Items = ["Select Value", "Break Down", "Working"];

  Map<int, Map<String, dynamic>> addImages = {};
  List<File?> capturedImages = [];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 90,
        title: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            color: themeProvider.isDarkTheme
                ? const Color(0xFF212121)
                : const Color(0xFF25476A),
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            height: 115,
            child: const SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Support Ticket Assesment",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Container(
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.all(
              defaultPadding,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(children: [
                  Row(children: [
                    Expanded(
                      child: ImageCapture(
                        capturedImages: capturedImages,
                        onImagesCaptured: (updatedImages) {
                          setState(() {
                            capturedImages = updatedImages.cast<File?>();
                          });
                        },
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Asset Id"),
                            const SizedBox(height: 5),
                            TextFormField(
                              focusNode: assetFocusNode,
                              controller: assetEditingController,
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(assetnameFoucusNode);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Value';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "assetId",
                                  fillColor: Colors.black,
                                  labelStyle:
                                      const TextStyle(color: Colors.black12),
                                  hintStyle:
                                      const TextStyle(color: Colors.black45),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Asset Name"),
                            TextFormField(
                              focusNode: assetnameFoucusNode,
                              controller: assetNameEditingController,
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(decriptionFocusNode);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Value';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Asset Name",
                                  fillColor: Colors.black,
                                  labelStyle:
                                      const TextStyle(color: Colors.black12),
                                  hintStyle:
                                      const TextStyle(color: Colors.black45),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Assessment"),
                      const SizedBox(height: 5),
                      TextFormField(
                        maxLines: 5,
                        focusNode: decriptionFocusNode,
                        controller: descriptionEditingController,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(assetnameFoucusNode);
                        // },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Value';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Description",
                            fillColor: Colors.black,
                            labelStyle: const TextStyle(color: Colors.black12),
                            hintStyle: const TextStyle(color: Colors.black45),
                            contentPadding:
                                const EdgeInsets.all(defaultPadding * 2),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Sollution"),
                      const SizedBox(height: 5),
                      TextFormField(
                        maxLines: 5,
                        focusNode: decriptionFocusNode,
                        controller: descriptionEditingController,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(assetnameFoucusNode);
                        // },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Value';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Sollution",
                            fillColor: Colors.black,
                            labelStyle: const TextStyle(color: Colors.black12),
                            hintStyle: const TextStyle(color: Colors.black45),
                            contentPadding:
                                const EdgeInsets.all(defaultPadding * 2),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Submit")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Go Back"))
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
