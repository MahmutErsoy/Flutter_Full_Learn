class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body; //servisten data geliyorsa her zaman gelmeyebilir, null da olabilir o yuzden nullable atadık

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json[
        'body']; //postmandan gelen datalar MAPtir ve bizizm bu dataları kullanabilmemiz icin jsondan liste, modele cevirmemiz gerekir.
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] =
        body; //post atarken servise liste veya model gondeririz ancak bunu yolda mape convert etmemiz gerek bu yuzden toJson yapısını kulanıırz
    return data;
  }
}
