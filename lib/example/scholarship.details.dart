import 'package:flutter/material.dart';
import 'package:flutter_interact_ku/example/data/scholarship.dart';
import 'package:flutter_interact_ku/example/data/scholarships.service.dart';

class ScholarshipDetails extends StatelessWidget {
  ScholarshipDetails(this.slug);
  final slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(slug),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: ScholarshipsService.get(slug),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildScholarshipDetails(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(child: Text("Error occured"));
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  _buildScholarshipDetails(Scholarship scholarship) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            scholarship.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Publish Date: ${scholarship.publishDate}"),
            Text("Expire Date: ${scholarship.closingDate}")
          ],),
          SizedBox(height: 10),
          Text(scholarship.description)
        ],
      ),
    );
  }
}
