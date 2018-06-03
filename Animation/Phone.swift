//
//  Phone.swift
//  Animation
//
//  Created by Bibizhan on 03.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit

class Phone{
   var phoneModel: String?
   var phonePrice: String?
   var phoneCamera: String?
   var phone: String?
    
    init(_ phoneModel: String, _ phonePrice: String, _ phoneCamera: String, _ phone: String) {
        self.phoneModel = phoneModel
        self.phonePrice = phonePrice
        self.phoneCamera = phoneCamera
        self.phone = phone
        
    }
}
