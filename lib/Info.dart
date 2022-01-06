class Info {

  final String name;
  final int age;
  final String bio;
  final String position;
  final String job;
  final String company;
  final String address;
  final bool isPremium;
  final String avatar;

  Info({
        required this.name, required this.age, required this.bio,required this.position,required this.job,required this.company,required this.address, required this.isPremium,required this.avatar
       });

  factory Info.fromJson(Map<String, dynamic>json) {
    return Info(
      name: json['name'],
      age: json['age'], 
      bio: json['bio'], 
      position: json['position'], 
      job: json['job'], 
      company: json['company'], 
      address: json['address'], 
      isPremium: json['isPremium'], 
      avatar: json['avatar'] );

  }
}