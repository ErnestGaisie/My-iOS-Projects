//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Ernest Gaisie on 08/02/2025.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
