//
//  MainViewController.swift
//  ApiInteraction
//
//  Created by Clay Suttner on 6/11/21.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let loginModel = LoginModel(email: emailTextField.text, password: passwordTextField.text)
        
        LoginRequest.post(loginModel: loginModel) { result in
            switch result {
            case .success(let responseModel):
                self.showSuccessScreen(with: responseModel.token)
            case .failure(let error):
                self.showAlert(with: error.localizedDescription)
            }
        }
    }
    
    func showSuccessScreen(with token: String) {
        DispatchQueue.main.async {
            let successScreen = SuccessViewController()
            successScreen.tokenValue = token
            self.navigationController?.pushViewController(successScreen, animated: true)
        }
        
    }
    
    func showAlert(with description: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                alert.dismiss(animated: true)
            }))
            self.present(alert, animated: true)
        }
    }
}

