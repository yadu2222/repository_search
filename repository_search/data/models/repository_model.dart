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

  static List<Repository> resToList(List<dynamic> res) {
    List<Repository> list = [];
    for (var item in res) {
      list.add(Repository(
        repositoryName: item['name'],
        repositoryOwner: item['owner']['login'],
        langage: item['language'],
        numberOfStars: item['stargazers_count'],
        numberOfWatchers: item['watchers_count'],
        numberOfForks: item['forks_count'],
        openIssues: item['open_issues'],
      ));
    }
    return list;
  }
}
