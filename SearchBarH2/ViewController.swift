//
//  ViewController.swift
//  SearchBarH2
//
//  Created by admin on 5/4/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friendsArray = [FriendItem]()
    var filteredFriends = [FriendItem]()
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            return self.filteredFriends.count
        }
        else
        {
            return self.friendsArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("tableCell0")! as UITableViewCell
        
        var friend : FriendItem
        
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            friend = self.filteredFriends[indexPath.row]
        }
        else
        {
            friend = self.friendsArray[indexPath.row]
        }
        
        
        cell.textLabel?.text = friend.name
        
        
        return cell    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var friend:FriendItem
        
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            friend = self.filteredFriends[indexPath.row]
        } else {
            friend = self.friendsArray[indexPath.row]
        }
        
        print(friend.name)
    }
    
    func filterContetnForSearchText(searchText: String, scope: String = "Title")
        
    {
        
        self.filteredFriends = self.friendsArray.filter({( friend : FriendItem) -> Bool in
            
            
            
            var categoryMatch = (scope == "Title")
            
            var stringMatch = friend.name.rangeOfString(searchText)
            
            
            
            return categoryMatch && (stringMatch != nil)
            
            
            
        })
        
        
        
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool
        
    {
        
        
        
        self.filterContetnForSearchText(searchString, scope: "Title")
        
        
        
        return true
        
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool
        
    {
        
        
        
        self.filterContetnForSearchText(self.searchDisplayController!.searchBar.text!, scope: "Title")        
        
        return true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.friendsArray += [FriendItem(name: "Vea Software")]
        self.friendsArray += [FriendItem(name: "Apple")]
        self.friendsArray += [FriendItem(name: "iTunes")]
        self.friendsArray += [FriendItem(name: "iPhone")]
        
        self.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

