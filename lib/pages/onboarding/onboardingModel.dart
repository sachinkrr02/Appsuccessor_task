class OnBoard {
  final String image, title, desc;

  OnBoard({
    required this.image,
    required this.title,
    required this.desc,
  });
}

final List<OnBoard> demo_data = [
  OnBoard(
      image: "assets/onboard1.png",
      title: "EMOTIONALLY BALANCED LIVING",
      desc:
          "Tailor soundscape to uplift, relax, or soothe your varying moods. Experience emotional wellness."),
  OnBoard(
      image: "assets/onboard2.png",
      title: "CATER TO YOUR NEEDS",
      desc:
          "From focused study to tranquil sleep , find the perfect sound for every purpose."),
  OnBoard(
      image: "assets/onboard3.png",
      title: "SOUNDSCAPES ENVIRONMENR",
      desc:
          "Craft personalized surroundings with layered sounds. Customizet your ambient experience."),
];
