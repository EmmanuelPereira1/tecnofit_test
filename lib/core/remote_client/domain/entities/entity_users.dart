class Entity {
  List<Content>? content;
  int? pageSize;
  int? pageNumber;
  int? numberOfElements;
  bool? empty;
  bool? lastPage;

  Entity(
      {this.content,
      this.pageSize,
      this.pageNumber,
      this.numberOfElements,
      this.empty,
      this.lastPage});

  Entity.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
    lastPage = json['lastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    data['pageSize'] = pageSize ?? '';
    data['pageNumber'] = pageNumber ?? '';
    data['numberOfElements'] = numberOfElements ?? '';
    data['empty'] = empty ?? '';
    data['lastPage'] = lastPage ?? '';
    return data;
  }
}

class Content {
  int? id;
  String? serialNumber;
  int? companyGroupId;
  String? companyGroupName;
  int? branchOfficeId;
  String? branchOfficeName;
  int? timesRetreaded;
  int? maxRetreadsExpected;
  double? recommendedPressure;
  double? currentPressure;
  double? middleInnerTreadDepth;
  double? outerTreadDepth;
  double? middleOuterTreadDepth;
  double? innerTreadDepth;
  String? dot;
  bool? newTire;
  String? status;
  String? createdAt;
  TireSize? tireSize;
  Make? make;
  Model? model;
  List? registrationImages;

  Content(
      {this.id,
      this.serialNumber,
      this.companyGroupId,
      this.companyGroupName,
      this.branchOfficeId,
      this.branchOfficeName,
      this.timesRetreaded,
      this.maxRetreadsExpected,
      this.recommendedPressure,
      this.currentPressure,
      this.middleInnerTreadDepth,
      this.outerTreadDepth,
      this.middleOuterTreadDepth,
      this.innerTreadDepth,
      this.dot,
      this.newTire,
      this.status,
      this.createdAt,
      this.tireSize,
      this.make,
      this.model,
      this.registrationImages});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serialNumber = json['serialNumber'];
    companyGroupId = json['companyGroupId'];
    companyGroupName = json['companyGroupName'];
    branchOfficeId = json['branchOfficeId'];
    branchOfficeName = json['branchOfficeName'];
    timesRetreaded = json['timesRetreaded'];
    maxRetreadsExpected = json['maxRetreadsExpected'];
    recommendedPressure = json['recommendedPressure'];
    currentPressure = json['currentPressure'];
    middleInnerTreadDepth = json['middleInnerTreadDepth'];
    outerTreadDepth = json['outerTreadDepth'];
    middleOuterTreadDepth = json['middleOuterTreadDepth'];
    innerTreadDepth = json['innerTreadDepth'];
    dot = json['dot'];
    newTire = json['newTire'];
    status = json['status'];
    createdAt = json['createdAt'];
    tireSize = json['tireSize'] != null
        ? TireSize.fromJson(json['tireSize'])
        : null;
    make = json['make'] != null ? Make.fromJson(json['make']) : null;
    model = json['model'] != null ? Model.fromJson(json['model']) : null;
    
   
    if (json['registrationImages'] != null) {
      registrationImages = [];
      json['registrationImages'].forEach((v) {
        registrationImages!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? '';
    data['serialNumber'] = serialNumber ?? '';
    data['companyGroupId'] = companyGroupId ?? '';
    data['companyGroupName'] = companyGroupName ?? '';
    data['branchOfficeId'] = branchOfficeId ?? '';
    data['branchOfficeName'] = branchOfficeName ?? '';
    data['timesRetreaded'] = timesRetreaded ?? '';
    data['maxRetreadsExpected'] = maxRetreadsExpected ?? '';
    data['recommendedPressure'] = recommendedPressure ?? '';
    data['currentPressure'] = currentPressure ?? '';
    data['middleInnerTreadDepth'] = middleInnerTreadDepth ?? '';
    data['outerTreadDepth'] = outerTreadDepth ?? '';
    data['middleOuterTreadDepth'] = middleOuterTreadDepth ?? '';
    data['innerTreadDepth'] = innerTreadDepth ?? '';
    data['dot'] = dot ?? '';
    data['newTire'] = newTire ?? '';
    data['status'] = status ?? '';
    data['createdAt'] = createdAt ?? '';
    if (tireSize != null) {
      data['tireSize'] = tireSize!.toJson();
    }
    if (make != null) {
      data['make'] = make!.toJson();
    }
    if (model != null) {
      data['model'] = model!.toJson();
    }
    if (registrationImages != null) {
      data['registrationImages'] =
          registrationImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TireSize {
  int? id;
  double? height;
  double? width;
  double? rim;

  TireSize({this.id, this.height, this.width, this.rim});

  TireSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    height = json['height'];
    width = json['width'];
    rim = json['rim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? '';
    data['height'] = height ?? '';
    data['width'] = width ?? '';
    data['rim'] = rim ?? '';
    return data;
  }
}

class Make {
  int? id;
  String? name;

  Make({this.id, this.name});

  Make.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? '';
    data['name'] = name ?? '';
    return data;
  }
}

class Model {
  int? id;
  String? name;
  int? groovesQuantity;
  double? treadDepth;

  Model({this.id, this.name, this.groovesQuantity, this.treadDepth});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    groovesQuantity = json['groovesQuantity'];
    treadDepth = json['treadDepth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id ?? '';
    data['name'] = name ?? '';
    data['groovesQuantity'] = groovesQuantity ?? '';
    data['treadDepth'] = treadDepth ?? '';
    return data;
  }
}
