// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: internal/v2/dgc_parameters.proto
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

struct SAP_Internal_V2_DGCParameters {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var testCertificateParameters: SAP_Internal_V2_DGCTestCertificateParameters {
    get {return _testCertificateParameters ?? SAP_Internal_V2_DGCTestCertificateParameters()}
    set {_testCertificateParameters = newValue}
  }
  /// Returns true if `testCertificateParameters` has been explicitly set.
  var hasTestCertificateParameters: Bool {return self._testCertificateParameters != nil}
  /// Clears the value of `testCertificateParameters`. Subsequent reads from it will return its default value.
  mutating func clearTestCertificateParameters() {self._testCertificateParameters = nil}

  var expirationThresholdInDays: UInt32 = 0

  var blockListParameters: SAP_Internal_V2_DGCBlocklistParameters {
    get {return _blockListParameters ?? SAP_Internal_V2_DGCBlocklistParameters()}
    set {_blockListParameters = newValue}
  }
  /// Returns true if `blockListParameters` has been explicitly set.
  var hasBlockListParameters: Bool {return self._blockListParameters != nil}
  /// Clears the value of `blockListParameters`. Subsequent reads from it will return its default value.
  mutating func clearBlockListParameters() {self._blockListParameters = nil}

  var reissueServicePublicKeyDigest: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _testCertificateParameters: SAP_Internal_V2_DGCTestCertificateParameters? = nil
  fileprivate var _blockListParameters: SAP_Internal_V2_DGCBlocklistParameters? = nil
}

struct SAP_Internal_V2_DGCTestCertificateParameters {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var waitAfterPublicKeyRegistrationInSeconds: UInt32 = 0

  var waitForRetryInSeconds: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct SAP_Internal_V2_DGCBlocklistParameters {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var blockedUvciChunks: [SAP_Internal_V2_DGCBlockedUVCIChunk] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct SAP_Internal_V2_DGCBlockedUVCIChunk {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var indices: [UInt32] = []

  var hash: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "SAP.internal.v2"

extension SAP_Internal_V2_DGCParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DGCParameters"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "testCertificateParameters"),
    2: .same(proto: "expirationThresholdInDays"),
    3: .same(proto: "blockListParameters"),
    4: .same(proto: "reissueServicePublicKeyDigest"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._testCertificateParameters) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.expirationThresholdInDays) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._blockListParameters) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.reissueServicePublicKeyDigest) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._testCertificateParameters {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if self.expirationThresholdInDays != 0 {
      try visitor.visitSingularUInt32Field(value: self.expirationThresholdInDays, fieldNumber: 2)
    }
    try { if let v = self._blockListParameters {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    if !self.reissueServicePublicKeyDigest.isEmpty {
      try visitor.visitSingularBytesField(value: self.reissueServicePublicKeyDigest, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_V2_DGCParameters, rhs: SAP_Internal_V2_DGCParameters) -> Bool {
    if lhs._testCertificateParameters != rhs._testCertificateParameters {return false}
    if lhs.expirationThresholdInDays != rhs.expirationThresholdInDays {return false}
    if lhs._blockListParameters != rhs._blockListParameters {return false}
    if lhs.reissueServicePublicKeyDigest != rhs.reissueServicePublicKeyDigest {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_V2_DGCTestCertificateParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DGCTestCertificateParameters"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "waitAfterPublicKeyRegistrationInSeconds"),
    2: .same(proto: "waitForRetryInSeconds"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.waitAfterPublicKeyRegistrationInSeconds) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.waitForRetryInSeconds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.waitAfterPublicKeyRegistrationInSeconds != 0 {
      try visitor.visitSingularUInt32Field(value: self.waitAfterPublicKeyRegistrationInSeconds, fieldNumber: 1)
    }
    if self.waitForRetryInSeconds != 0 {
      try visitor.visitSingularUInt32Field(value: self.waitForRetryInSeconds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_V2_DGCTestCertificateParameters, rhs: SAP_Internal_V2_DGCTestCertificateParameters) -> Bool {
    if lhs.waitAfterPublicKeyRegistrationInSeconds != rhs.waitAfterPublicKeyRegistrationInSeconds {return false}
    if lhs.waitForRetryInSeconds != rhs.waitForRetryInSeconds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_V2_DGCBlocklistParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DGCBlocklistParameters"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "blockedUvciChunks"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.blockedUvciChunks) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.blockedUvciChunks.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.blockedUvciChunks, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_V2_DGCBlocklistParameters, rhs: SAP_Internal_V2_DGCBlocklistParameters) -> Bool {
    if lhs.blockedUvciChunks != rhs.blockedUvciChunks {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_V2_DGCBlockedUVCIChunk: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DGCBlockedUVCIChunk"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "indices"),
    2: .same(proto: "hash"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedUInt32Field(value: &self.indices) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.hash) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.indices.isEmpty {
      try visitor.visitPackedUInt32Field(value: self.indices, fieldNumber: 1)
    }
    if !self.hash.isEmpty {
      try visitor.visitSingularBytesField(value: self.hash, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_V2_DGCBlockedUVCIChunk, rhs: SAP_Internal_V2_DGCBlockedUVCIChunk) -> Bool {
    if lhs.indices != rhs.indices {return false}
    if lhs.hash != rhs.hash {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
