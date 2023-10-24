class UserModel {
  final String name;
  final int countFollowers;
  final int countFollowing;
  final int countPosts;
  final String urlImage;
  final String location;
  final String bio;
  final List<String> urlPhotos;
  bool isFollowing;

  UserModel({
    required this.name,
    required this.countFollowers,
    required this.countFollowing,
    required this.countPosts,
    required this.urlImage,
    required this.location,
    required this.bio,
    required this.urlPhotos,
    required this.isFollowing,
  });
}

final users = <UserModel>[
  UserModel(
    name: 'Elon Musk .',
    bio:
    'Elon Musk is a visionary entrepreneur and business magnate known for his pioneering work in technology, space exploration, and electric vehicles. He co-founded companies like Tesla, SpaceX, and Neuralink, with a relentless drive to revolutionize industries and shape the future..',
    countFollowers: 43,
    countFollowing: 78,
    location: ' Washington, USA.',
    isFollowing: false,
    countPosts: 410,
    urlImage: 'assets/eprofile.jpg',
    urlPhotos: [
      'assets/e1.jpg',
      'assets/e2.jpeg',
      'assets/e3.jpg',
      'assets/e5.jpeg',
    ],
  ),
  UserModel(
    name: 'Bill Gates,',
    bio:
        'Bill Gates, co-founder of Microsoft and prominent philanthropist, reshaped the tech industry and dedicated his wealth to improving global health and education..',
    countFollowers: 1400,
    countFollowing: 100,
    location: 'Washington, USA.',
    isFollowing: true,
    countPosts: 35,
    urlImage: 'assets/b2.jpg',
    urlPhotos: [
      'assets/b1.jpeg',
      'assets/b2.jpg',
      'assets/b3.jpg',
      'assets/b5.jpg',
    ],
  ),
  UserModel(
    name: 'Steve Jobs',
    bio:
        'Steve Jobs, co-founder of Apple, was a tech visionary and design maven who transformed personal computing and consumer electronics, leaving an indelible mark on the world.',
    countFollowers: 1800,
    countFollowing: 510,
    location: 'San Francisco, California, USA',
    isFollowing: false,
    countPosts: 118,
    urlImage: 'assets/s2.jpeg',
    urlPhotos: [
      'assets/s1.jpg',
      'assets/s2.jpeg',
      'assets/s3.jpg',
    ],
  ),

];
