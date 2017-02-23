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
    
    /// Function shows how many rows should be visible
    ///
    /// - Parameters:
    ///   - tableView: tableView
    ///   - section: section
    /// - Returns: number of rows to appear
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

