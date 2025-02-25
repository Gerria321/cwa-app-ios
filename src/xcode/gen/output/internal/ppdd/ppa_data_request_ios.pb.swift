// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: internal/ppdd/ppa_data_request_ios.proto
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

struct SAP_Internal_Ppdd_PPADataRequestIOS {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var authentication: SAP_Internal_Ppdd_PPACIOS {
    get {return _storage._authentication ?? SAP_Internal_Ppdd_PPACIOS()}
    set {_uniqueStorage()._authentication = newValue}
  }
  /// Returns true if `authentication` has been explicitly set.
  var hasAuthentication: Bool {return _storage._authentication != nil}
  /// Clears the value of `authentication`. Subsequent reads from it will return its default value.
  mutating func clearAuthentication() {_uniqueStorage()._authentication = nil}

  var payload: SAP_Internal_Ppdd_PPADataIOS {
    get {return _storage._payload ?? SAP_Internal_Ppdd_PPADataIOS()}
    set {_uniqueStorage()._payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  var hasPayload: Bool {return _storage._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  mutating func clearPayload() {_uniqueStorage()._payload = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "SAP.internal.ppdd"

extension SAP_Internal_Ppdd_PPADataRequestIOS: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PPADataRequestIOS"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "authentication"),
    2: .same(proto: "payload"),
  ]

  fileprivate class _StorageClass {
    var _authentication: SAP_Internal_Ppdd_PPACIOS? = nil
    var _payload: SAP_Internal_Ppdd_PPADataIOS? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _authentication = source._authentication
      _payload = source._payload
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularMessageField(value: &_storage._authentication) }()
        case 2: try { try decoder.decodeSingularMessageField(value: &_storage._payload) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      try { if let v = _storage._authentication {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      } }()
      try { if let v = _storage._payload {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      } }()
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_Ppdd_PPADataRequestIOS, rhs: SAP_Internal_Ppdd_PPADataRequestIOS) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._authentication != rhs_storage._authentication {return false}
        if _storage._payload != rhs_storage._payload {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
