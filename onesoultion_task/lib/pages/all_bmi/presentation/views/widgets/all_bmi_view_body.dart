import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onesoultion_task/pages/all_bmi/presentation/model_views/helpers/bmi_data_helper.dart';
import 'package:onesoultion_task/pages/all_bmi/presentation/model_views/helpers/extract_bmi_data.dart';
import 'package:onesoultion_task/pages/all_bmi/presentation/model_views/helpers/extract_current_page_data.dart';
import 'package:onesoultion_task/pages/all_bmi/presentation/views/widgets/bmi_info_Card.dart';
import 'package:onesoultion_task/pages/all_bmi/presentation/views/widgets/next_and_prev_buttons.dart';
import 'package:onesoultion_task/pages/update_bmi/presentation/views/widgets/update_view_body.dart';

class AllBmiViewBody extends StatefulWidget {
  const AllBmiViewBody({Key? key}) : super(key: key);

  @override
  AllBmiViewBodyState createState() => AllBmiViewBodyState();
}

class AllBmiViewBodyState extends State<AllBmiViewBody> {
  int currentPage = 0;
  int itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('bmi_data')
          .orderBy('dateTime', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No BMI data available.'));
        }

        List<Map<String, dynamic>> bmiDataList =
            extractBmiDataList(snapshot.data!);

        List<Map<String, dynamic>> currentPageData = extractCurrentPageData(
          bmiDataList,
          currentPage,
          itemsPerPage,
        );

        return SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: currentPageData.length,
                  itemBuilder: (context, index) {
                    String docId = currentPageData[index]['docId'] ?? '';

                    return BmiCard(
                      onCardPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateBmiViewBody(
                              initialData: currentPageData[index],
                            ),
                          ),
                        );
                      },
                      bmiStatus:
                          'Status: ${currentPageData[index]['bmiStatus']}',
                      bmiData: 'BMI: ${currentPageData[index]['bmi']}',
                      height: 'Height: ${currentPageData[index]['height']}',
                      weight: 'Weight: ${currentPageData[index]['weight']}',
                      datetime:
                          'Datetime: ${formatDateTime(currentPageData[index]['dateTime'])}',
                      onDeletePressed: () {
                        deleteBmiData(docId);
                      },
                    );
                  },
                ),
                NextAndPrevButtonsRow(
                  currentPage: 'Page ${currentPage + 1}',
                  onPrevPreesed: currentPage > 0
                      ? () => setState(() => currentPage--)
                      : null,
                  onNextPressed:
                      (currentPage + 1) * itemsPerPage < bmiDataList.length
                          ? () => setState(() => currentPage++)
                          : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
