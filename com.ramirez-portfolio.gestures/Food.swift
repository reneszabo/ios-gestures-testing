//
//  Food.swift
//  Talkabit
//
//  Created by Rene Ramirez on 9/30/15.
//  Copyright © 2015 Rene Ramirez. All rights reserved.
//

import UIKit

struct Food {
  var name: String?
  var price: String?
  var description: String?
  var photo: String?
  var photoLow: String?
  init(name: String?, price: String?,description: String?,photo: String?,photoLow: String?){
    self.name = name
    self.price = price
    self.description = description
    self.photo = photo
    self.photoLow = photoLow
 
  }
}
