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
}

let Templates = [
    Template(id: 0,
             name: "Nail Polisher",
             description: "This template help you to cover the border between your nail and finger, so you can easily apply any nail polisher",
             customizable: true,
             customizationDescription: "1. Take a photo of your hand.\n2.Get 3D model.",
             active: true),
    Template(id: 1,
             name: "Nail Art Template",
             description: "This template help you apply a single-color shape, after you apply a nail polisher.",
             customizable: false,
             customizationDescription: "",
             active: true),
    Template(id: 2,
             name: "Lipstick Template (Upcoming)",
             description: "Scan your lips with FaceID scanner and get a customized template to apply lipstick easily.",
             customizable: true,
             customizationDescription: "",
             active: false)
]
