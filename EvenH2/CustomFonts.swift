//
//  CustomFonts.swift
//  H2
//
//  Created by 장상경 on 10/22/24.
//

import Foundation
import UIKit

extension UIFont {
    static func dmSans(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "DMSans"
        
        var weightString: String
        switch weight {
//        case .black:
//            weightString = "Black"
        case .bold:
            weightString = "Bold"
//        case .heavy:
//            weightString = "ExtraBold"
//        case .ultraLight:
//            weightString = "ExtraLight"
//        case .light:
//            weightString = "Light"
//        case .medium:
//            weightString = "Medium"
        case .regular:
            weightString = "Regular"
//        case .semibold:
//            weightString = "SemiBold"
//        case .thin:
//            weightString = "Thin"
        default:
            weightString = "Regular"
        }
        
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
}
