class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = '',
    this.money = 0,
    this.rating = 0.0,
  });

  String title;
  String lessonCount;
  int money;
  double rating;
  String imagePath;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'User interface Design',
      lessonCount: '24',
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'User interface Design',
      lessonCount: '22',
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Player Unknown Battle Ground Mobile',
      lessonCount: 'FPS',
      money: 25,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Mobile Legend Bang-Bang',
      lessonCount: 'MOBA',
      money: 208,
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Call of Duty Mobile',
      lessonCount: 'FPS',
      money: 25,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Rainbow Six Siege',
      lessonCount: 'FPS',
      money: 208,
    ),
  ];
}
