//
//  SuccessViewController.swift
//  ApiInteraction
//
//  Created by Clay Suttner on 6/11/21.
//

import UIKit

class SuccessViewController: UIViewController {
    @IBOutlet weak var tokenLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
}
