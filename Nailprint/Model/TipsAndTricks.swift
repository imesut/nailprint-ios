//
//  TipsAndTricks.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import Foundation

struct TipsAndTrick {
    let id : Int
    let title : String
    let description : String
    let author : String
    let date: String
}

let TipsAndTricks = [
    TipsAndTrick(id: 0,
                 title: "Things you should know before applying nail polish",
                 description: """
                 Moisturizing your nails before starting to apply nail polish will make the application process easier.
                 The most accessible method for visually impaired individuals is to use a 3D template. You can order this template for yourself from the home tab of the application, or you can obtain the file that you can print out.
                 You can apply your nail polish without smudging it by wearing this template on your finger.
                 If you are applying a dark colored nail polish, it is recommended that you first apply a clear nail polish. Take the polish and take some polish on your brush. Start by applying the first layer from the center of your nail.
                 Then wait for about 5 minutes and you can start applying your second layer of polish after your polish has dried.
                 If you want to decide which color nail polish to apply, you can check out our accessible content where we explain which colors can be used in which environments.
                """,
                 author: "NailPrint",
                 date: "20 March 2023"),
    TipsAndTrick(id: 1,
                 title: "Selection of Nail Polish Color According to Your Clothes",
                 description: """
                It is generally recommended to choose nail polish colors according to your skin tone. You can check our content that explains which nail polish colors should be used with which skin tones.
                However, sometimes we may want to choose nail polish colors according to our clothes. Therefore, we are sharing below which color nail polish can be more beautiful with which color.

                Black Clothes:
                • Red
                • Silver
                • White
                nail polishes are recommended.

                Red Color:
                • Black
                • White
                • Blue
                colored nail polishes are recommended. Silver or gold colors can also be used on special occasions.

                Yellow Color:
                • Turquoise
                • Purple
                • Green
                colors are recommended.

                White Color:
                • Red nail polish: makes it look more elegant.
                • Gold and silver give a heavier look.
                • Black or pastel colors.

                Blue Color:
                • Intense blue tone
                • Turquoise
                • White
                • Silver
                colored nail polishes are recommended.
                """,
                 author: "Buket Gencaydin",
                 date: "17 March 2023"),
    TipsAndTrick(id: 2,
                 title: "Selection of Nail Polish Color According to Your Skin Tone",
                 description: """
                    Fair Skin
                    •    If you want to use colored nail polish, you should prefer yellow undertone nail polishes. Dark shades of pink, plum, and red colors will look great on your hands. You should avoid bronze and metallic colors.
                    Wheatish Skin
                    •    The sweetest color of the summer, peach tones, are just your color! You can highlight your hands by applying peach and terracotta colors on your nails. In winter months, you must try all shades of red. Especially, red tones with copper will suit you best! If you like different manicure styles, you must try gold color.
                    Bronze/Dark Skin
                    Summer is here, we started to get tanned... All nail polishes in brown tones will make you look more attractive. Metallic and copper tone nail polishes will shine brightly on your nails, but you should stay away from gold tones. In addition to these, lively colors like blue and orange will suit your hands very well, you should not be afraid to try them.
                    """,
                 author: "Gamze",
                 date: "15 March 2023")
]
