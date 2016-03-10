//
//  MovieCell.swift
//  Favorite Movies
//
//  Created by hendri on 9/03/2016.
//  Copyright © 2016 hendri. All rights reserved.
//

import UIKit
import WebKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    
//    var urlToLoad: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(movie: Movie) {
        movieImage.image = movie.getImage()
        movieTitle.text = movie.title
        movieDesc.text = "\"\(movie.desc!)\""
//        urlToLoad = movie.imdb
    }
    

}




