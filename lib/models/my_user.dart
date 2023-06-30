
class MyUSer {
  String email = "";
  String uid = "";
  String photoUrl = "";
  String username = "";
  String userDescription = "";
  List followers = [];
  List following = [];

  myUser({
    required String email,
    required String uid,
    required String photoUrl,
    required String username,
    required String userDescription,
    required List followers,
    required List following
}){
  this.email = email;
  this.uid = uid;
  this.photoUrl = photoUrl;
  this.username = username;
  this.userDescription = userDescription;
  this.followers = followers;
  this.following = following;

  }

  Map<String, dynamic> toJson()=>{
    "username": username,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "userDescription": userDescription,
    "followers": followers,
    "following": following
  };

}