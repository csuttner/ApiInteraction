//
//  MainViewController.swift
//  ApiInteraction
//
//  Created by Clay Suttner on 6/11/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        LoginRequest.post()
    }
}

