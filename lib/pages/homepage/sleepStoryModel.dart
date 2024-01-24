class SleepStoryModel {
  final String image, title, desc;

  SleepStoryModel({
    required this.image,
    required this.title,
    required this.desc,
  });
}

final List<SleepStoryModel> sleep_story = [
  SleepStoryModel(
    image: "assets/sleep3.png",
    title: "The Young Scout",
    desc: "10k Listners",
  ),
  SleepStoryModel(
    image: "assets/sleep2.png",
    title: "The Starry Journey",
    desc: "10k listners ",
  ),
  SleepStoryModel(
    image: "assets/sleep3.png",
    title: "The Young Scout",
    desc: "10k Listners",
  ),
];
