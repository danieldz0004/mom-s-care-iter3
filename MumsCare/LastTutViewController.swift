//
//  LastTutViewController.swift
//  Week9Tutorial
//
//  Created by Ziyi Deng on 19/5/19.
//  Copyright © 2019 Jason Haasz. All rights reserved.
//

import UIKit
import PopupDialog

class LastTutViewController: UIViewController {

    @IBAction func showPopup(_ sender: Any) {
        //Follow these steps to change the language of the application to Chinese:
        //Go to Mobile settings -> General -> Language -> Region -> iPhone Language -> Chinese, Simplified
        //let title = NSLocalizedString("", comment: "")
        
        let message = NSLocalizedString("Follow these steps to change the language of the application to Chinese:\nGo to Mobile settings -> General -> Language -> Region -> iPhone Language -> Chinese, Simplified", comment: "")
        
        // Create the dialog
        let popup = PopupDialog(title: nil, message: message, image: nil, preferredWidth: 580)
        
        // Create first button
        let buttonOne = DefaultButton(title: NSLocalizedString("Got it", comment: "")) {
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne])
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
