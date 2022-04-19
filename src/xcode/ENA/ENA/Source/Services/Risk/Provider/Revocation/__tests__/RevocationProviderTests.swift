//
// 🦠 Corona-Warn-App
//

import XCTest
@testable import ENA

class RevocationProviderTests: CWATestCase {

	func testGIVEN_base64_WHEN_ToHexString_THEN_ResultIsValid() {
		// GIVEN
		let base64 = "yLHLNvSl428="

		// WHEN
		let hexString = Data(base64Encoded: base64)?.toHexString() ?? ""

		// THEN
		XCTAssertEqual(hexString, "c8b1cb36f4a5e36f")
	}

	func testGIVEN_base64_WHEN_HexEncodedString_THEN_ResultIsValid() {
		// GIVEN
		let base64 = "yLHLNvSl428="

		// WHEN
		let hexString = Data(base64Encoded: base64)?.hexEncodedString() ?? ""

		// THEN
		XCTAssertEqual(hexString, "c8b1cb36f4a5e36f".uppercased())
	}


	func testGIVEN_given_WHEN_when_THEN_then() throws {
		// GIVEN

		let restService = RestServiceProviderStub(
			loadResources: [
				LoadResource(
					result: .success(revocationKidList),
					willLoadResource: nil
				),
				LoadResource(
					result: .success(try kidTypeIndex()),
					willLoadResource: { resource in
						guard let resource = resource as? KIDTypeIndexResource else {
							XCTFail("wrong resource type")
							return
						}
						// As the requests are done sorted by type, 0a should be requested first
						XCTAssertEqual(resource.locator.paths, ["version", "v1", "dcc-rl", "\(self.recoveryCertificateKeyIdentifier)0a", "index"])
					}
				),
				LoadResource(
					result: .success(try revocationChunk()),
					willLoadResource: { resource in
						guard let resource = resource as? KIDTypeChunkResource else {
							XCTFail("wrong resource type, KIDTypeChunkResource expected")
							return
						}

						XCTAssertEqual(resource.locator.paths, ["version", "v1", "dcc-rl", "\(self.recoveryCertificateKeyIdentifier)0a", "e3", "d6", "chunk"])
					}
				)
			]
		)

		let revocationProvider = RevocationProvider(restService, signatureVerifier: MockVerifier())

		// WHEN

		let expectation = expectation(description: "success expectation")

		revocationProvider.updateCache(with: certificates) { result in
			// THEN
			switch result {
			case .success:
				expectation.fulfill()
			case .failure:
				XCTFail("unexpected state - should be success")
			}
		}

		waitForExpectations(timeout: .greatestFiniteMagnitude)
	}

	private let testCertificateKeyIdentifier = "0123456789abcdef"
	private let recoveryCertificateKeyIdentifier = "f5c5970c3039d854"

	private lazy var certificates: [HealthCertificate] = {
		[
			try? vaccinationCertificate(
				doseNumber: 1,
				totalSeriesOfDoses: 2,
				keyIdentifier: "8c4ae0ed458b67f1".dataWithHexString(),
				signature: "8c4ae0ed458b67f1".dataWithHexString()
			),
			try? vaccinationCertificate(
				doseNumber: 2,
				totalSeriesOfDoses: 2,
				keyIdentifier: "f50159a32d84e89d".dataWithHexString(),
				signature: "f50159a32d84e89d".dataWithHexString()
			),
			try? testCertificate(
				keyIdentifier: testCertificateKeyIdentifier.dataWithHexString(),
				signature: testCertificateKeyIdentifier.dataWithHexString()
			),
			try? recoveryCertificate(
				keyIdentifier: recoveryCertificateKeyIdentifier.dataWithHexString(),
				signature: recoveryCertificateKeyIdentifier.dataWithHexString()
			)
		].compactMap { $0 }
	}()

	private func kidTypeIndex() throws -> SAP_Internal_Dgc_RevocationKidTypeIndex {
		let recoveryCoordinate0b = try coordinate(for: certificates[3], hashType: "0b")
		var item0 = SAP_Internal_Dgc_RevocationKidTypeIndexItem()
		item0.x = recoveryCoordinate0b.x.dataWithHexString()
		item0.y = [recoveryCoordinate0b.y.dataWithHexString(), "ad".dataWithHexString()]

		let recoveryCoordinate0a = try coordinate(for: certificates[3], hashType: "0a")
		var item1 = SAP_Internal_Dgc_RevocationKidTypeIndexItem()
		item1.x = recoveryCoordinate0a.x.dataWithHexString()
		item1.y = [recoveryCoordinate0a.y.dataWithHexString(), "ad".dataWithHexString()]

		let testCertificateCoordinate = try coordinate(for: certificates[2], hashType: "0a")
		var item2 = SAP_Internal_Dgc_RevocationKidTypeIndexItem()
		item2.x = testCertificateCoordinate.x.dataWithHexString()
		item2.y = [testCertificateCoordinate.y.dataWithHexString()]

		let vaccinationCoordinate = try coordinate(for: certificates[0], hashType: "0a")
		var item3 = SAP_Internal_Dgc_RevocationKidTypeIndexItem()
		item3.x = vaccinationCoordinate.x.dataWithHexString()
		item3.y = [vaccinationCoordinate.y.dataWithHexString()]

		var item4 = SAP_Internal_Dgc_RevocationKidTypeIndexItem()
		item4.x = "11".dataWithHexString()
		item4.y = ["12".dataWithHexString()]

		var kidTypeIndex = SAP_Internal_Dgc_RevocationKidTypeIndex()
		kidTypeIndex.items = [
			item0,
			item1,
			item2,
			item3,
			item4
		].shuffled()
		return kidTypeIndex
	}

	private func coordinate(for certificate: HealthCertificate, hashType: String) throws -> RevocationCoordinate {
		let recoveryHash = try XCTUnwrap(certificate.hash(by: hashType))
		return RevocationCoordinate(hash: recoveryHash)
	}

	var revocationKidList: SAP_Internal_Dgc_RevocationKidList {
		// recoveryCertificate
		var item1 = SAP_Internal_Dgc_RevocationKidListItem()
		item1.kid = recoveryCertificateKeyIdentifier.dataWithHexString()
		item1.hashTypes = ["0b".dataWithHexString(), "0a".dataWithHexString()]

		// dummy
		var item2 = SAP_Internal_Dgc_RevocationKidListItem()
		item2.kid = "fedcba9876543210".dataWithHexString()
		item2.hashTypes = ["0c".dataWithHexString()]

		// testCertificate
		var item3 = SAP_Internal_Dgc_RevocationKidListItem()
		item3.kid = testCertificateKeyIdentifier.dataWithHexString()
		item3.hashTypes = ["0a".dataWithHexString(), "0c".dataWithHexString()]

		var kidList = SAP_Internal_Dgc_RevocationKidList()
		kidList.items = [item1, item2, item3].shuffled()
		return kidList
	}

	func revocationChunk() throws -> SAP_Internal_Dgc_RevocationChunk {
		let recoveryHash0a = try XCTUnwrap(certificates[3].hash(by: "0a"))
		let recoveryHash0b = try XCTUnwrap(certificates[3].hash(by: "0b"))
		let vaccinationHash = try XCTUnwrap(certificates[1].hash(by: "0a"))

		var revocationChunk = SAP_Internal_Dgc_RevocationChunk()
		revocationChunk.hashes = [
			recoveryHash0a.dataWithHexString(),
			recoveryHash0b.dataWithHexString(),
			vaccinationHash.dataWithHexString()
		]

		return revocationChunk
	}

}
