class SalesModel {
  final String image, listners, title, desc, index;

  SalesModel(
      {required this.image,
      required this.listners,
      required this.title,
      required this.desc,
      required this.index});
}

final List<SalesModel> demo_data = [
  SalesModel(
      image: "assets/fitness.png",
      title: "Fitness",
      listners: "4.5K Listners",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      index: "1"),
  SalesModel(
      image: "assets/medi.png",
      title: "Sleep",
      listners: "4.5K Listners",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      index: "2"),
  SalesModel(
      image: "assets/sleep.png",
      title: "Meditaton",
      listners: "4.5K Listners",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      index: "3"),
  SalesModel(
      image: "assets/study.png",
      title: "Study",
      listners: "45K Listners",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      index: "4"),
  SalesModel(
      image: "assets/moti.png",
      title: "Motivation",
      listners: "45K Listners",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      index: "5"),
];
