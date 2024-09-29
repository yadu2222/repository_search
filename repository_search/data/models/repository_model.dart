class Repository {
  String repositoryName;
  String repositoryOwner;
  String langage;
  int numberOfStars;
  int numberOfWatchers;
  int numberOfForks;
  int openIssues;

  Repository({
    required this.repositoryName,
    required this.repositoryOwner,
    required this.langage,
    required this.numberOfStars,
    required this.numberOfWatchers,
    required this.numberOfForks,
    required this.openIssues,
  });
}
