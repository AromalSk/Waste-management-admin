
// ignore_for_file: public_member_api_docs, sort_constructors_first
class CollectionSchedule {
  String? days;
  String? type;

  CollectionSchedule({this.days, this.type});

  CollectionSchedule.fromJson(Map<String, dynamic> json) {
    days = json['days'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['days'] = days;
    data['type'] = type;
    return data;
  }
}
