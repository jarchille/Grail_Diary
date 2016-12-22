//
//  DetailsTVC.swift
//  Grail Diary
//
//  Created by Jonathan Archille on 12/22/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class DetailsTVC: UIViewController
{
    
    var synopsisText = ""
    var seriesRunText = ""
    var favCharacterText = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        synopsis.text = synopsisText
        seriesRun.text = "Original release: \(seriesRunText)"
        favCharaster.text = "Favorite character: \(favCharacterText)"
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var seriesRun: UILabel!
    @IBOutlet weak var favCharaster: UILabel!
    



}
Gr
