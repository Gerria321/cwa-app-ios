// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: internal/v2/ppdd_edus_parameters.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// This file is auto-generated, DO NOT make any changes here

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersIOS {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var common: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon {
    get {return _common ?? SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon()}
    set {_common = newValue}
  }
  /// Returns true if `common` has been explicitly set.
  var hasCommon: Bool {return self._common != nil}
  /// Clears the value of `common`. Subsequent reads from it will return its default value.
  mutating func clearCommon() {self._common = nil}

  var ppac: SAP_Internal_V2_PPDDPrivacyPreservingAccessControlParametersIOS {
    get {return _ppac ?? SAP_Internal_V2_PPDDPrivacyPreservingAccessControlParametersIOS()}
    set {_ppac = newValue}
  }
  /// Returns true if `ppac` has been explicitly set.
  var hasPpac: Bool {return self._ppac != nil}
  /// Clears the value of `ppac`. Subsequent reads from it will return its default value.
  mutating func clearPpac() {self._ppac = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _common: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon? = nil
  fileprivate var _ppac: SAP_Internal_V2_PPDDPrivacyPreservingAccessControlParametersIOS? = nil
}

struct SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersAndroid {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var common: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon {
    get {return _common ?? SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon()}
    set {_common = newValue}
  }
  /// Returns true if `common` has been explicitly set.
  var hasCommon: Bool {return self._common != nil}
  /// Clears the value of `common`. Subsequent reads from it will return its default value.
  mutating func clearCommon() {self._common = nil}

  var ppac: SAP_Internal_V2_PPDDPrivacyPreservingAccessControlParametersAndroid {
    get {return _ppac ?? SAP_Internal_V2_PPDDPrivacyPreservingAccessControlParametersAndroid()}
    set {_ppac = newValue}
  }
  /// Returns true if `ppac` has been explicitly set.
  var hasPpac: Bool {return self._ppac != nil}
  /// Clears the value of `ppac`. Subsequent reads from it will return its default value.
  mutating func clearPpac() {self._ppac = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _common: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon? = nil
  fileprivate var _ppac: SAP_Internal_V2_PPDDPrivacyPreservingAccessControlParametersAndroid? = nil
}

struct SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var otpQueryParameterName: String = String()

  var surveyOnHighRiskEnabled: Bool = false

  var surveyOnHighRiskURL: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "SAP.internal.v2"

extension SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersIOS: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PPDDEventDrivenUserSurveyParametersIOS"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "common"),
    2: .same(proto: "ppac"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._common) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._ppac) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._common {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._ppac {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersIOS, rhs: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersIOS) -> Bool {
    if lhs._common != rhs._common {return false}
    if lhs._ppac != rhs._ppac {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersAndroid: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PPDDEventDrivenUserSurveyParametersAndroid"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "common"),
    2: .same(proto: "ppac"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._common) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._ppac) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._common {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._ppac {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersAndroid, rhs: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersAndroid) -> Bool {
    if lhs._common != rhs._common {return false}
    if lhs._ppac != rhs._ppac {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PPDDEventDrivenUserSurveyParametersCommon"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "otpQueryParameterName"),
    2: .same(proto: "surveyOnHighRiskEnabled"),
    3: .same(proto: "surveyOnHighRiskUrl"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.otpQueryParameterName) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.surveyOnHighRiskEnabled) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.surveyOnHighRiskURL) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.otpQueryParameterName.isEmpty {
      try visitor.visitSingularStringField(value: self.otpQueryParameterName, fieldNumber: 1)
    }
    if self.surveyOnHighRiskEnabled != false {
      try visitor.visitSingularBoolField(value: self.surveyOnHighRiskEnabled, fieldNumber: 2)
    }
    if !self.surveyOnHighRiskURL.isEmpty {
      try visitor.visitSingularStringField(value: self.surveyOnHighRiskURL, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon, rhs: SAP_Internal_V2_PPDDEventDrivenUserSurveyParametersCommon) -> Bool {
    if lhs.otpQueryParameterName != rhs.otpQueryParameterName {return false}
    if lhs.surveyOnHighRiskEnabled != rhs.surveyOnHighRiskEnabled {return false}
    if lhs.surveyOnHighRiskURL != rhs.surveyOnHighRiskURL {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
