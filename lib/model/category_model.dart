class CategoryModel {
  String id;
  String title;
  String image;

  CategoryModel({required this.title, required this.id, required this.image});

  //
  static List<CategoryModel> getCategoryList(bool isDark) {
    return [
      CategoryModel(
          title: "General",
          id: 'general',
          image: !isDark
              ? 'assets/images/general.png'
              : 'assets/images/generalDark.png'),
      CategoryModel(
          title: "Business",
          id: 'business',
          image: !isDark
              ? 'assets/images/business.png'
              : 'assets/images/businessDark.png'),
      CategoryModel(
          title: "Sports",
          id: 'sports',
          image: !isDark
              ? 'assets/images/sports.png'
              : 'assets/images/sportDark.png'),
      CategoryModel(
          title: "Technology",
          id: 'technology',
          image: !isDark
              ? 'assets/images/technology.png'
              : 'assets/images/technologyDark.png'),
      CategoryModel(
          title: "Entertainment",
          id: 'entertainment',
          image: !isDark
              ? 'assets/images/enter.png'
              : 'assets/images/enterDark.png'),
      CategoryModel(
          title: "Health",
          id: 'health',
          image: !isDark
              ? 'assets/images/health.png'
              : 'assets/images/healthDark.png'),
      CategoryModel(
          title: "Science",
          id: 'science',
          image: !isDark
              ? 'assets/images/science.png'
              : 'assets/images/scienceDark.png'),
    ];
  }
}
