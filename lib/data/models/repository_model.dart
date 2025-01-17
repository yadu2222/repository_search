class Repository {
  String id;
  String repositoryName;
  String repositoryOwner;
  String langage;
  int numberOfStars;
  int numberOfWatchers;
  int numberOfForks;
  int openIssues;
  String repositoryUrl;
  String ownerUrl;

  Repository({
    required this.id,
    required this.repositoryName,
    required this.repositoryOwner,
    required this.langage,
    required this.numberOfStars,
    required this.numberOfWatchers,
    required this.numberOfForks,
    required this.openIssues,
    required this.repositoryUrl,
    required this.ownerUrl,
  });

  static List<Repository> resToList(List<dynamic> res) {
    List<Repository> list = [];
    for (var item in res) {
      list.add(Repository(
        id: item['id'].toString(),
        repositoryName: item['name'] ?? '',
        repositoryOwner: item['owner']['avatar_url'] ?? '',
        langage: item['language'] ?? '',
        numberOfStars: item['stargazers_count'] ?? 0,
        numberOfWatchers: item['watchers_count'] ?? 0,
        numberOfForks: item['forks'] ?? 0,
        openIssues: item['open_issues'] ?? 0,
        repositoryUrl: item['html_url'] ?? '',
        ownerUrl: item['owner']['html_url'] ?? '',
      ));
    }
    return list;
  }
}
