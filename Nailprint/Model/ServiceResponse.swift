//
//  ServiceResponse.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 16.03.2023.
//

import Foundation

struct ServiceResponse: Decodable {
    let fingerCount : Int
    let message : String
    let stlArchive : String
}
