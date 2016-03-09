//
//  ViewController.swift
//  Favorite Movies
//
//  Created by hendri on 9/03/2016.
//  Copyright © 2016 hendri. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navItem: UINavigationItem!
    
    var movies = [Movie]()
    var currentCell: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        navItem.titleView = UIImageView(image: UIImage(named: "FAVCINE"))
        navigationController?.navigationBar.translucent = true
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchData()
        tableView.reloadData()
    }
    
//    MARK: - Table
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            currentCell = indexPath.row
            cell.configureCell(movies[currentCell])
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func fetchData() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let result = try context.executeFetchRequest(fetchRequest)
            movies = result as! [Movie]
        } catch {
            print("unable to fetch")
        }
    }
    
//    MARK: - segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailVCSegue" {
            if let destinationVC = segue.destinationViewController as? DetailVC {
                destinationVC.ttl = movies[currentCell].title
                destinationVC.desc = movies[currentCell].desc
                destinationVC.plot = movies[currentCell].plotSummary
                destinationVC.img = movies[currentCell].getImage()
            }
        }
    }
    


}

