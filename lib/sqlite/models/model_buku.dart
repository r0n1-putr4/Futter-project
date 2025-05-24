class ModelBuku {
  final int? id;
  final String namaBuku;
  final String judulBuku;

  ModelBuku({this.id, required this.namaBuku, required this.judulBuku});

  //insert data ke dalam
  Map<String, dynamic> toMap() {
    return {'id': id, 'namaBuku': namaBuku, 'judulBuku': judulBuku};
  }

  //get data
  factory ModelBuku.fromMap(Map<String, dynamic> map) {
    return ModelBuku(
      id: map['id'],
      namaBuku: map['namaBuku'],
      judulBuku: map['judulBuku'],
    );
  }
}
