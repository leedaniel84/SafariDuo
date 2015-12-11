//
//  SearchViewController.swift
//  Sidefari
//
//  Created by Michael Sacks on 12/10/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var pastSitesDataSource = HistoryController.getPastSites()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

  
    @IBAction func goButtonTapped(sender: UIButton) {
        
        openInSafari(searchTextField.text!)
        
        HistoryController.addPastSite(searchTextField.text!)
        pastSitesDataSource = HistoryController.getPastSites()
        tableView.reloadData()
    }
    
    @IBAction func pasteButtonTapped(sender: UIButton) {
        let pasteboard = UIPasteboard.generalPasteboard()
        searchTextField.text = pasteboard.string
    }
    
    //MARK: - TableView Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if pastSitesDataSource.count < 15 {
            return pastSitesDataSource.count
        } else {
            return 15
        }
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = pastSitesDataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        openInSafari(pastSitesDataSource[indexPath.row])
        
    }
    
    func openInSafari(urlString: String) {
        if let url = NSURL(string: "http://\(urlString)") {
            let safariViewController = SFSafariViewController(URL: url)
            self.presentViewController(safariViewController, animated: true, completion: nil)
        }
    }

}
