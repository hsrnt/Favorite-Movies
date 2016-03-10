//
//  addMovieVC.swift
//  Favorite Movies
//
//  Created by hendri on 9/03/2016.
//  Copyright © 2016 hendri. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var imdbField: UITextField!
    @IBOutlet weak var plotSummaryField: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var addImageBtn: UIButton!
    
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        movieImg.layer.cornerRadius = 20
        movieImg.clipsToBounds = true
        
        self.navigationController?.navigationBar.barStyle = .Black
        navigationItem.titleView = UIImageView(image: UIImage(named: "FAVCINE"))

    }
    
    override func viewDidLayoutSubviews() {
        if movieImg.image != nil {
            addImageBtn.titleLabel?.text = ""
        }
    }
    
    @IBAction func addImage(sender: UIButton) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
        addImageBtn.titleLabel?.text = ""
    }
    

    @IBAction func addMovie(sender: UIButton) {
//        save to coreData:
        if titleField.text != "" && descField.text != "" && imdbField.text != ""  && movieImg.image != nil {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)
            let movie = Movie(entity: entity!, insertIntoManagedObjectContext: context)
            
            movie.title = titleField.text
            movie.desc = descField.text
            movie.imdb = imdbField.text
            movie.plotSummary = plotSummaryField.text
            movie.setMovieImage(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("unable to save")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

}





