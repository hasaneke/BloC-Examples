enum APIPaths {
  baseUrl('https://dummyjson.com'),
  todosEndPoint('/todos'),
  loginEndPoint('/auth/login');

  final String path;
  const APIPaths(this.path);
}
