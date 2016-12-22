//
//  HomeVC.swift
//  Grail Diary
//
//  Created by Jonathan Archille on 12/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {

    var shows = [animatedShow]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTVShowData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        let aShow = shows[indexPath.row]
        cell.textLabel?.text = aShow.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsTVC
        {
            
            let aShow = shows[(tableView.indexPathForSelectedRow?.row)!]
            
            destination.favCharacterText = aShow.favCharacter
            destination.seriesRunText = aShow.seriesRun
            destination.synopsisText = aShow.synopsis
            
        }
    }
 
    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
    
    func fetchTVShowData() {
        if let path  = Bundle.main.path(forResource: "movies.json", ofType: nil)
        {
            if let jsonData = NSData(contentsOfFile: path) {
                do {
                    let jsonDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: []) as! [[String: Any]]
                    for dictionary in jsonDictionary {
                        if let _ = dictionary as? [String: Any]
                        {
                            guard let title = dictionary["title"] as? String else { return }
                            guard let seriesRun = dictionary["seriesRun"] as? String else { return }
                            guard let favCharacters = dictionary["favCharacters"] as? String else { return }
                            guard let synopsis = dictionary["synopsis"] as? String else { return }
                        
                            shows.append(animatedShow(title: title, favCharacter: favCharacters, seriesRun: seriesRun, synopsis: synopsis))
                        }
                    }
                  
                } catch {}
            }
            
            
            
        }
        
    }
    
    
}



