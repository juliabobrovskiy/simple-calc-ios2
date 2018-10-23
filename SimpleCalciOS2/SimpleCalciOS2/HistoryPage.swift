//
//  HistoryPage.swift
//  SimpleCalciOS2
//
//  Created by Julia Bobrovskiy on 10/22/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import Foundation
import UIKit

class HistoryPage: UIViewController {
    var historyVals: [String] = []
    var yOff = 0

    @IBOutlet weak var scrollFunc: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for val in historyVals.reversed() {
            let lab = UILabel(frame: CGRect(x: 10, y: yOff, width: 200, height: 60))
            yOff += 70
            lab.text = val
            
            scrollFunc.addSubview(lab)
        }
    }
}

