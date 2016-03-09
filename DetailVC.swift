//
//  DetailVC.swift
//  Favorite Movies
//
//  Created by hendri on 10/03/2016.
//  Copyright © 2016 hendri. All rights reserved.
//

import UIKit
import CoreData

class DetailVC: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    
    var img: UIImage!
    var ttl: String!
    var desc: String!
    var plot: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        movieImage.image = img
        movieTitle.text = ttl
        movieDesc.text = desc
        moviePlot.text = plot
    }

    

//    func fetchData() {
//        let app = UIApplication.sharedApplication().delegate as! AppDelegate
//        let context = app.managedObjectContext
//        let fetchRequest = NSFetchRequest(entityName: "Movie")
//        
//        do {
//
//        }
//    }

}
