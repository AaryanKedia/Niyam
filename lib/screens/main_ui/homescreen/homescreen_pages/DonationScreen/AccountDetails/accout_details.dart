import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niyam/utils/colours.dart';

class AccountDetails extends StatefulWidget {
  final String documentId;

  final List<String> lines;
  final double size;

  const AccountDetails(
      {super.key,
      required this.documentId,
      required this.lines,
      required this.size});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  late Stream<DocumentSnapshot> artiStream;

  @override
  void initState() {
    super.initState();
    getOnTheLoad();
  }

  void getOnTheLoad() {
    artiStream = DatabaseMethods().getArtiDetails(widget.documentId);
    setState(() {});
  }

  Widget displayArtiDetails(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>?;

    if (data == null) {
      return Center(
          child: Text(
        'कृपया अपना इंटरनेट चालू करें और\n पुनः प्रयास करें',
        style: TextStyle(
            color: baseColor.shade900,
            fontSize: widget.size,
            fontFamily: 'hind'),
        textAlign: TextAlign.center,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            data[widget.lines[0]] as String,
            style: TextStyle(
              color: baseColor,
              fontSize: widget.size,
              fontFamily: 'hind_bold',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Bank : ',
              style: TextStyle(
                  color: baseColor.shade200,
                  fontWeight: FontWeight.w800,
                  fontSize: widget.size + 1),
              children: [
                TextSpan(
                  text: data[widget.lines[1]] as String,
                  style: TextStyle(
                      color: baseColor,
                      fontSize: widget.size - 4,
                      fontWeight: FontWeight.w500),
                )
              ]),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  text: 'Account No. : ',
                  style: TextStyle(
                      color: baseColor.shade200,
                      fontWeight: FontWeight.w800,
                      fontSize: widget.size + 1),
                  children: [
                    TextSpan(
                      text: data[widget.lines[2]] as String,
                      style: TextStyle(
                          color: baseColor,
                          fontSize: widget.size - 4,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: data[widget.lines[2]] as String));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      backgroundColor: const Color(0xff3c0008),
                      elevation: 2,
                      duration: const Duration(seconds: 1),
                      content: Text(
                        "Account No. Copied",
                        style: TextStyle(
                            color: baseColor.shade500,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.copy_rounded,
                  size: 18,
                  color: baseColor.shade50.withOpacity(0.4),
                ))
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  text: 'IFSC Code : ',
                  style: TextStyle(
                      color: baseColor.shade200,
                      fontWeight: FontWeight.w800,
                      fontSize: widget.size + 1),
                  children: [
                    TextSpan(
                      text: data[widget.lines[3]] as String,
                      style: TextStyle(
                          color: baseColor,
                          fontSize: widget.size - 4,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: data[widget.lines[3]] as String));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      backgroundColor: const Color(0xff3c0008),
                      elevation: 2,
                      duration: const Duration(seconds: 1),
                      content: Text(
                        "IFSC Code Copied",
                        style: TextStyle(
                            color: baseColor.shade500,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.copy_rounded,
                  size: 18,
                  color: baseColor.shade50.withOpacity(0.4),
                ))
          ],
        ),
      ],
    );
    // return Text(data['line1'] as String);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: artiStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: Text(
            "Fetching...",
            style: TextStyle(color: baseColor),
          ));
        }

        if (!snapshot.hasData) {
          return Center(
            child: Text(
              'कुछ तकनीकी समस्या है,\n'
              'कृपया व्यवस्थापक से बात करें',
              style: TextStyle(
                  color: baseColor.shade900,
                  fontSize: widget.size,
                  fontFamily: 'hind'),
              textAlign: TextAlign.center,
            ),
          );
        }

        return displayArtiDetails(snapshot.data!);
      },
    );
  }
}

class DatabaseMethods {
  Stream<DocumentSnapshot> getArtiDetails(String documentId) {
    return FirebaseFirestore.instance
        .collection('account_details')
        .doc(documentId)
        .snapshots();
  }
}
