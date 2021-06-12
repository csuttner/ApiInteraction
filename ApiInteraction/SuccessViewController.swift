//
//  SuccessViewController.swift
//  ApiInteraction
//
//  Created by Clay Suttner on 6/11/21.
//

import UIKit

class SuccessViewController: UIViewController {
    @IBOutlet weak var tokenLabel: UILabel!
    
    var tokenValue: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tokenLabel.text = tokenValue
        
        navigationController?.navigationBar.isHidden = false
    }
    
}
