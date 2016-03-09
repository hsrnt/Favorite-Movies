//
//  Movie.swift
//  Favorite Movies
//
//  Created by hendri on 9/03/2016.
//  Copyright © 2016 hendri. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {
    
    func setMovieImage(img: UIImage) {
        let imgData = UIImagePNGRepresentation(img)
        self.image = imgData //image is from the entity
    }
    
    func getImage() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }
    
    

}
