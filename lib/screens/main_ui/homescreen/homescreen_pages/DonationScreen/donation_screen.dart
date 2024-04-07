import 'package:flutter/material.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/DonationScreen/qr_fetch_widget/qr_fetch_widget.dart';

import '../../../../../utils/colours.dart';
import '../../../../../utils/sizes.dart';
import '../../../../../utils/texts.dart';
import '../AboutUsScreen/AboutUsWidget/about_us_widget.dart';
import 'AccountDetails/accout_details.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DonationScreen();
}

class _DonationScreen extends State<DonationScreen> {
  @override
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: false,
        body: Container(
          color: const Color(0xff3c0008),
          child: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [gradient1, gradient2], radius: 1.25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            donation,
                            style: TextStyle(
                              fontSize: defaultSize * 1.25,
                              fontFamily: 'hind_bold',
                              color: baseColor,
                            ),
                          ),
                        ),
                        AboutUsWidget(),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 20,),

                  // QR CODE

                  Column(
                    children: [
                      FutureBuilder(
                          future: QrFetchWidget().getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Container(
                                width: 220,
                                height: 220,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 6,
                                      color: gradient1.withOpacity(1)),
                                  borderRadius: BorderRadius.circular(26),
                                  boxShadow: [
                                    BoxShadow(
                                      color: gradient2.withOpacity(0.6),
                                      spreadRadius: 4,
                                      blurRadius: 15,
                                      offset: const Offset(-4,
                                          4), // changes the shadow direction
                                    ),
                                    BoxShadow(
                                      color: gradient2.withOpacity(0.6),
                                      spreadRadius: 4,
                                      blurRadius: 15,
                                      offset: const Offset(4,
                                          -4), // changes the shadow direction
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "छवि लोड करने में समस्या",
                                  style: TextStyle(
                                      color: baseColor.shade900,
                                      fontSize: 20,
                                      fontFamily: 'hind'),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.done && snapshot.hasData && snapshot.data is String) {
                              return Container(
                                // height: 220,
                                // width: 220,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 6,
                                      color: gradient1.withOpacity(1)),
                                  borderRadius: BorderRadius.circular(26),
                                  boxShadow: [
                                    BoxShadow(
                                      color: gradient2.withOpacity(0.6),
                                      spreadRadius: 4,
                                      blurRadius: 15,
                                      offset: const Offset(-4,
                                          4), // changes the shadow direction
                                    ),
                                    BoxShadow(
                                      color: gradient2.withOpacity(0.6),
                                      spreadRadius: 4,
                                      blurRadius: 15,
                                      offset: const Offset(4,
                                          -4), // changes the shadow direction
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    snapshot.data.toString(),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(
                                color: baseColor,
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: 30,
                        color: baseColor.shade50,
                      ),
                      Text(
                        "SCAN ME TO PAY",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: baseColor.shade50,
                        ),
                      ),
                    ],
                  ),

                  // ACCOUNT DETAILS

                  const AccountDetails(
                    lines: ['name', 'bank', 'accountno', 'ifsc'],
                    documentId: 'account',
                    size: 20,
                  ),

                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
