import 'package:flutter/material.dart';
import 'package:flutter_interact_ku/example/scholarship.details.dart';

import 'data/scholarship.dart';
import 'data/scholarships.service.dart';

class ScholarshipsScreen extends StatefulWidget {
  @override
  _ScholarshipsScreenState createState() => _ScholarshipsScreenState();
}

class _ScholarshipsScreenState extends State<ScholarshipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scholarships"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
            future: ScholarshipsService.list(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildScholarshipsList(snapshot.data);
              } else if (snapshot.hasError) {
                return Center(child: Text("Error occured"));
              }

              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  _buildScholarshipsList(List<Scholarship> scholarships) {
    if (scholarships.length == 0) {
      return Center(child: Text('No scholarship found'));
    }

    return ListView.builder(
      itemCount: scholarships.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(scholarships[index].title),
          subtitle: Text("Expires in " + scholarships[index].closingDate),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => ScholarshipDetails(scholarships[index].slug),
            ),
          ),
        );
      },
    );
  }
}
