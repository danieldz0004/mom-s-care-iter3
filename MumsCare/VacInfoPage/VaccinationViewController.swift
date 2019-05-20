//
//  VaccinationViewController.swift
//  mom's care
//
//  Created by Daniel Dz on 5/4/19.
//  Copyright © 2019 Daniel Dz. All rights reserved.
//

import UIKit

class VaccinationViewController: UIViewController {

    
    @IBOutlet weak var vaccImgInfo: UIImageView!
    var selection: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if selection == "China0-2" {
            vaccImgInfo.image = #imageLiteral(resourceName: "0-2cn")
        } else if selection == "China2-4" {
            vaccImgInfo.image = #imageLiteral(resourceName: "2-4cn")
        } else if selection == "China4-6" {
            vaccImgInfo.image = #imageLiteral(resourceName: "4-6cn")
        } else if selection == "China6-8" {
            vaccImgInfo.image = #imageLiteral(resourceName: "6-8cn")
        } else if selection == "China8-12" {
            vaccImgInfo.image = #imageLiteral(resourceName: "8-12cn")
        } else if selection == "India0-2" {
            vaccImgInfo.image = #imageLiteral(resourceName: "Building")
        } else if selection == "India2-4" {
            vaccImgInfo.image = #imageLiteral(resourceName: "Building")
        } else if selection == "India4-6" {
            vaccImgInfo.image = #imageLiteral(resourceName: "Building")
        } else if selection == "India6-8" {
            vaccImgInfo.image = #imageLiteral(resourceName: "Building")
        } else if selection == "India8-12" {
            vaccImgInfo.image = #imageLiteral(resourceName: "Building")
        } else {
            vaccImgInfo.image = #imageLiteral(resourceName: "Building")
        }
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
