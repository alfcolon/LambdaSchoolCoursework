//
//  Planet.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

struct Planet: Codable {
    var name: String
    var imageName: String
    
    var image: UIImage {
        return UIImage(named: self.imageName)!
    }
}
