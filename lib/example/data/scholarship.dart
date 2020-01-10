class Scholarship {
  String slug;
  String title;
  String description;
  String publishDate;
  String closingDate;

  Scholarship(this.slug, this.title, this.description, this.publishDate,
      this.closingDate);

  Scholarship.fromJson(Map<String, dynamic> json)
      : slug = json['slug'],
        title = json['title'],
        description = json['description'],
        publishDate = json['publishDate'].toString().split("T")[0],
        closingDate = json['closingDate'].toString().split("T")[0];
}
