class ImageModel{
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  ImageModel({this.raw, this.full, this.regular, this.small, this.thumb});

  factory ImageModel.fromJson(Map<String, dynamic> json){
    return ImageModel(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb']
    );
  }

}