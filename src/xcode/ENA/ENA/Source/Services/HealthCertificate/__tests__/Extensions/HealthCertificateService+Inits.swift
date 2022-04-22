//
// 🦠 Corona-Warn-App
//

import XCTest
import Foundation
import HealthCertificateToolkit
@testable import ENA

extension HealthCertificateService {
	convenience init(
		store: HealthCertificateStoring,
		dccSignatureVerifier: DCCSignatureVerifying,
		dscListProvider: DSCListProviding,
		appConfiguration: AppConfigurationProviding,
		digitalCovidCertificateAccess: DigitalCovidCertificateAccessProtocol = DigitalCovidCertificateAccess(),
		notificationCenter: UserNotificationCenter = UNUserNotificationCenter.current(),
		cclService: CCLServable,
		recycleBin: RecycleBin,
		revocationProvider: RevocationProvider
	) {
		self.init(
			store: store,
			dccSignatureVerifier: dccSignatureVerifier,
			dscListProvider: dscListProvider,
			appConfiguration: appConfiguration,
			digitalCovidCertificateAccess: digitalCovidCertificateAccess,
			notificationCenter: notificationCenter,
			cclService: cclService,
			recycleBin: recycleBin,
			revocationProvider: revocationProvider,
			healthCertificateValidator: HealthCertificateValidatorFake()
		)
	}
}