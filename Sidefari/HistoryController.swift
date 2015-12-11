//
//  HistoryController.swift
//  Sidefari
//
//  Created by Michael Sacks on 12/10/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class HistoryController {
    
    static let kWebsitesKey = "websitesKey"
    
    static func getPastSites() -> [String] {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let websites = defaults.arrayForKey(kWebsitesKey) as? [String] {
            return websites
        } else {
            return []
        }
    }
    
    static func addPastSite(newSite: String) {
        var pastSites = HistoryController.getPastSites()
        pastSites.insert(newSite, atIndex: 0)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(pastSites, forKey: kWebsitesKey)
    }

}
