//
//  Templates.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import Foundation

struct Template {
    let id : Int
    let name : String
    let description : String
    let customizable : Bool
    let customizationDescription : String
    let active : Bool
    let stlFile : String
}

let Templates = [
    Template(id: 0,
             name: "Nail Polisher",
             description: "This template help you to cover the border between your nail and finger, so you can easily apply any nail polisher",
             customizable: true,
             customizationDescription: "1. Take a photo of your hand. Please not that, this model might be affected by light conditions and flash use.\n\n2. You'll get a information about the success rate and whether all of your nails detected or not.\n\n3. You'll be able to choose between \"Add to My Subscription\" or you can get an export of the 3D printable files for each of the recognized nails.\n\n4. You can scan again for your remaining fingers/nails..",
             active: true,
             stlFile: "nail_polisher"),
    Template(id: 1,
             name: "Nail Art Template",
             description: "This template help you apply a single-color shape, after you apply a nail polisher.",
             customizable: false,
             customizationDescription: "",
             active: true,
             stlFile: "nailart"),
    Template(id: 2,
             name: "Lipstick Template (Upcoming)",
             description: "Scan your lips with FaceID scanner and get a customized template to apply lipstick easily.",
             customizable: true,
             customizationDescription: "",
             active: false,
             stlFile: "")
]
