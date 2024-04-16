import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:niyam/utils/colours.dart';
import 'package:url_launcher/url_launcher.dart'; // Use url_launcher directly

class AboutScreen extends StatefulWidget {
  final String documentId;
  final String name;
  final List<String> lines;

  const AboutScreen(
      {super.key,
      required this.documentId,
      required this.name,
      required this.lines});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late Stream<DocumentSnapshot> aboutStream;

  final websiteUri = Uri.parse(
      'https://www.facebook.com/shri.narsingh.dham?mibextid=qi2Omg&rdid=uzsvhMjqMDYcGT6h');

  @override
  void initState() {
    super.initState();
    getOnTheLoad();
  }

  void getOnTheLoad() {
    aboutStream = DatabaseMethods().getAboutDetails(widget.documentId);
    setState(() {});
  }

  Widget displayAboutDetails(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>?;

    if (data == null) {
      return Center(
          child: Text(
        'कृपया अपना इंटरनेट चालू करें और\n पुनः प्रयास करें',
        style: TextStyle(
            color: baseColor.shade900, fontSize: 20, fontFamily: 'hind'),
        textAlign: TextAlign.center,
      ));
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              data[widget.lines[0]] as String,
              style: const TextStyle(
                color: baseColor,
                fontSize: 20,
                fontFamily: 'hind_medium',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data[widget.lines[1]] as String,
              style: const TextStyle(
                color: baseColor,
                fontSize: 20,
                fontFamily: 'hind_medium',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data[widget.lines[0]] as String,
              style: const TextStyle(
                color: baseColor,
                fontSize: 20,
                fontFamily: 'hind_medium',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "संपर्क संख्या : ",
                  style: TextStyle(
                      fontFamily: 'hind_medium',
                      color: baseColor,
                      fontSize: 20),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        final Uri url =
                            Uri(scheme: 'tel', path: data[widget.lines[3]]);

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          if (kDebugMode) {
                            print("Cannot Lauch This URL");
                          }
                        }
                      },
                      child: Text(
                        data[widget.lines[3]] as String,
                        style: TextStyle(
                          color: baseColor.shade900,
                          fontSize: 20,
                          fontFamily: 'hind_medium',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        final Uri url =
                            Uri(scheme: 'tel', path: data[widget.lines[4]]);

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          if (kDebugMode) {
                            print("Cannot Lauch This URL");
                          }
                        }
                      },
                      child: Text(
                        data[widget.lines[4]] as String,
                        style: TextStyle(
                          color: baseColor.shade900,
                          fontSize: 20,
                          fontFamily: 'hind_medium',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Brand(Brands.whatsapp),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      final whatsapp = Uri.parse(
                          'https://wa.me/${data[widget.lines[5]] as String}');
                      launchUrl(whatsapp, mode: LaunchMode.externalApplication);
                    },
                    child: Text(
                      "Shri Narsingh Bandh Balajee Dham",
                      style: TextStyle(
                          fontFamily: 'hind_medium',
                          color: baseColor.shade900,
                          fontSize: 17),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Brand(Brands.facebook),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      launchUrl(websiteUri,
                          mode: LaunchMode.externalApplication);
                    },
                    child: Text(
                      "Shri Narsingh Bandh Balajee Dham",
                      style: TextStyle(
                          fontFamily: 'hind_medium',
                          color: baseColor.shade900,
                          fontSize: 17),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 5, color: gradient1)),
              width: 320,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "पता :",
                      style: TextStyle(
                          fontFamily: 'hind_semi_bold',
                          color: baseColor,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   InkWell(
                     onTap: (){

                         Clipboard.setData(ClipboardData(text: data['address'] as String));
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             shape: const RoundedRectangleBorder(
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                             ),
                             backgroundColor: const Color(0xff3c0008),

                             elevation: 2,
                             duration: const Duration(seconds: 1),
                             content: Text("Address Copied",style: TextStyle(color: baseColor.shade500,fontWeight: FontWeight.bold),textAlign: TextAlign.center ,),
                           ),
                         );


                     },
                     child: Text(
                       data['address'] as String,
                       style: TextStyle(
                           fontFamily: 'hind_medium',
                           color: baseColor.shade900,
                           fontSize: 20),
                     ),
                   ),
                   InkWell(
                     onTap: (){
                       final Uri directions = Uri.parse(data['directionLink']);
                       launchUrl(directions,
                           mode: LaunchMode.externalApplication);
                     },
                       child: const Icon(Icons.directions,color: baseColor,size: 35,))



                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: baseColor.shade200,
            )),
        centerTitle: true,
        title: Text(
          widget.name,
          style: TextStyle(color: baseColor.shade300, fontSize: 26),
        ),
      ),
      body: Container(
        color: const Color(0xff3c0008),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient:
                  RadialGradient(colors: [gradient1, gradient2], radius: 1.25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: StreamBuilder<DocumentSnapshot>(
                stream: aboutStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: baseColor,
                    ));
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        'कुछ तकनीकी समस्या है,\n'
                        'कृपया व्यवस्थापक से बात करें',
                        style: TextStyle(
                            color: baseColor.shade900,
                            fontSize: 20,
                            fontFamily: 'hind'),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  return displayAboutDetails(snapshot.data!);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DatabaseMethods {
  Stream<DocumentSnapshot> getAboutDetails(String documentId) {
    return FirebaseFirestore.instance
        .collection('about_screen')
        .doc(documentId)
        .snapshots();
  }
}
