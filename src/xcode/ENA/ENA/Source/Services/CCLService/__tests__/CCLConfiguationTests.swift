//
// 🦠 Corona-Warn-App
//

import XCTest
import HealthCertificateToolkit
import ZIPFoundation
@testable import ENA

class CCLServiceConfigurationTests: CCLServiceBaseTests {

	func cclConfigurationData() throws -> Data {
		return try XCTUnwrap(
			Archive.createArchiveData(
				accessMode: .create,
				cborData: HealthCertificateToolkit.CCLConfigurationCBORDataFake()
			)
		)
	}

	// MARK: - Configuration logic on CCLService Layer

	func testGIVEN_emptyCache_WHEN_404_THEN_didChangeIsFalse() throws {
		// GIVEN
		let eTag = "DummyDataETag"
		let stack = MockNetworkStack(
			httpStatus: 404,
			headerFields: [
				"ETag": eTag
			]
		)

		let restServiceProvider = RestServiceProvider(session: stack.urlSession, cache: KeyValueCacheFake())
		let cclService = CCLService(restServiceProvider, cclServiceMode: [.configuration], signatureVerifier: MockVerifier())
		let expectation = expectation(description: "update finished")

		// WHEN
		var result: Bool = false
		cclService.updateConfiguration { didChange in
			result = didChange
			expectation.fulfill()
		}

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertFalse(result)
	}

	func testGIVEN_cachedCCLConfigurationFromYesterDay_WHEN_200_THEN_didChangeIsTrue() throws {
		// GIVEN
		let eTag = "DummyDataETag"
		let cclConfigurationData = try cclConfigurationData()

		let stack = MockNetworkStack(
			httpStatus: 200,
			headerFields: [
				"ETag": eTag + "new"
			],
			responseData: cclConfigurationData
		)
		let cache = try cache(with: Locator.CCLConfiguration(isFake: false), eTag: eTag, date: yesterday, responseData: cclConfigurationData)
		let restServiceProvider = RestServiceProvider(session: stack.urlSession, cache: cache)
		let cclService = CCLService(restServiceProvider, cclServiceMode: [.configuration], signatureVerifier: MockVerifier())
		let expectation = expectation(description: "update finished")

		// WHEN
		var result: Bool = false
		cclService.updateConfiguration { didChange in
			result = didChange
			expectation.fulfill()
		}

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertTrue(result)
	}

	func testGIVEN_cachedCCLConfigurationFromToday_WHEN_200_THEN_didChangeIsFalse() throws {
		// GIVEN
		let eTag = "DummyDataETag"
		let cclConfigurationData = try cclConfigurationData()

		let stack = MockNetworkStack(
			httpStatus: 200,
			headerFields: [
				"ETag": eTag + "new"
			],
			responseData: cclConfigurationData
		)
		let cache = try cache(with: Locator.CCLConfiguration(isFake: false), eTag: eTag, date: today, responseData: cclConfigurationData)
		let restServiceProvider = RestServiceProvider(session: stack.urlSession, cache: cache)
		let cclService = CCLService(restServiceProvider, cclServiceMode: [.configuration], signatureVerifier: MockVerifier())
		let expectation = expectation(description: "update finished")

		// WHEN
		var result: Bool = false
		cclService.updateConfiguration { didChange in
			result = didChange
			expectation.fulfill()
		}

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertFalse(result)
	}

}