enum APIPaths {
  baseUrl('https://dummyjson.com'),
  getTodosByUserIdEndPoint('/todos/user/'),
  loginEndPoint('/auth/login');

  final String path;
  const APIPaths(this.path);
}
