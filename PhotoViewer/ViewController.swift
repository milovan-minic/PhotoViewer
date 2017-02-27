//
//  ViewController.swift
//  PhotoViewer
//
//  Created by Milovan Minic on 2/22/17.
//  Copyright © 2017 Milovan Minic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                
                pictures.append(item)
                
            }
        }
        
    }
    
    /// Method shows how many rows should be visible
    ///
    /// - Parameters:
    ///   - tableView: tableView
    ///   - section: section
    /// - Returns: number of rows to appear
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    /// Method shows name of picture fie to be shown in each cell
    ///
    /// - Parameters:
    ///   - tableView: tableView
    ///   - indexPath: indexPath
    /// - Returns: name of picture file
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    /// Method instantiates DetailsViewController once image is selected
    ///
    /// - Parameters:
    ///   - tableView: tableViev
    ///   - indexPath: indexPath
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. Try loading the "Details" view controller and typecasting it to DetailsViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailsViewController {
            // 2. Success! Set it's selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3. Now push it to the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

