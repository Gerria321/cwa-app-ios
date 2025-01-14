////
// 🦠 Corona-Warn-App
//

import UIKit
import ZIPFoundation

class LogDataItem: NSObject, UIActivityItemSource {

	let compressedData: NSData

	/// New `LogDataItem` from file at given URL
	/// - Parameter url: The file url to read. The content represents this item
	init?(at url: URL) {
		guard
			let archive = Archive(accessMode: .create)
		else {
			Log.warning("No log data to export.", log: .localData)
			return nil
		}

		do {
			try archive.addEntry(with: url.lastPathComponent, relativeTo: url.deletingLastPathComponent(), compressionMethod: .deflate)

			guard let compressed = archive.data else {
				Log.warning("Log compression failed for unknown reasons.", log: .localData)
				return nil
			}
			self.compressedData = compressed as NSData
		} catch {
			Log.error("Log export error: \(error)", log: .localData, error: error)
			return nil
		}
	}

	// MARK: - UIActivityItemSource

	func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
		// Here the type is important, not the content
		return "CWA Log"
	}

	func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
		do {
			let temporaryURL = URL(fileURLWithPath: NSTemporaryDirectory().appending("cwa-log.zip"))
			try compressedData.write(to: temporaryURL, options: .atomic)
			return temporaryURL
		} catch {
			Log.error("", log: .localData, error: error)
			return nil
		}
	}

	func activityViewController(_ activityViewController: UIActivityViewController, dataTypeIdentifierForActivityType activityType: UIActivity.ActivityType?) -> String {
		return "de.rki.coronawarnapp.log"
	}

	func activityViewController(_ activityViewController: UIActivityViewController, thumbnailImageForActivityType activityType: UIActivity.ActivityType?, suggestedSize size: CGSize) -> UIImage? {
		return UIImage(named: "Icons_CWAAppIcon")
	}

}
