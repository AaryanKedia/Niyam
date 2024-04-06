import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:niyam/utils/colours.dart';

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

    return ListView.builder(
      itemCount: widget.lines.length, // Adjust the itemCount as needed
      itemBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                data[widget.lines[index]] as String,
                style: const TextStyle(
                  color: baseColor,
                  fontSize: 20,
                  fontFamily: 'hind_medium',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
    // return Text(data['line1'] as String);
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
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 8,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [gradient1, gradient2], radius: 1.25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
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
