//
//  Utils.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 16.03.2023.
//

import Foundation

// Swift doesn't handle base64 padding automatically.

func bs64Padding(bs64 : String) -> String {
    let remainder = bs64.count % 4
    if remainder == 0 {
        return bs64
    } else {
        return bs64 + String(repeating: "=", count: 4-remainder)
        //        let paddedLength = bs64.count + 4 - remainder
        //        return bs64.padding(toLength: paddedLength, withPad: "=", startingAt: 0)
        //    }
    }
}
