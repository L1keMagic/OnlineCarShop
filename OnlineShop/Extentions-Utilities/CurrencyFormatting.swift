import Foundation
import UIKit

extension Decimal {
    var asLocaleCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }
}
