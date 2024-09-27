class StateGenerics<S, F> {
  S? data;
  F? error;
  Status status;
  int? statusCode;

  bool get hasError => error != null;

  StateGenerics.loading({this.data, this.error, this.status = Status.loading, this.statusCode});
  StateGenerics.success({this.data, this.error, this.status = Status.success, this.statusCode});
  StateGenerics.failed({this.data, this.error, this.status = Status.failed, this.statusCode});
}

enum Status { loading, failed, success }