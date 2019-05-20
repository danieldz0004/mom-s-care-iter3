//
//  TabBarViewController.swift
//  Week9Tutorial
//
//  Created by Daniel Dz on 29/4/19.
//  Copyright © 2019 Jason Haasz. All rights reserved.
//

import UIKit
import BWWalkthrough

class TabBarViewController: UITabBarController, BWWalkthroughViewControllerDelegate {
    
    var isShow = true

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.selectedIndex = 3
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

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        let userDefaults = UserDefaults.standard
//
//        if !userDefaults.bool(forKey: "walkthroughPresented") {
//
//            showWalkthrough()
//
//            userDefaults.set(true, forKey: "walkthroughPresented")
//            userDefaults.synchronize()
//        }
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isShow {
            
            showWalkthrough()
            
            isShow = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showWalkthrough(){
        
        // Get view controllers and build the walkthrough
        let stb = UIStoryboard(name: "Walkthrough", bundle: nil)
        let walkthrough = stb.instantiateViewController(withIdentifier: "walk") as! BWWalkthroughViewController
        let page_one = stb.instantiateViewController(withIdentifier: "walk1")
        let page_two = stb.instantiateViewController(withIdentifier: "walk2")
        let page_three = stb.instantiateViewController(withIdentifier: "walk3")
        let page_four = stb.instantiateViewController(withIdentifier: "walk4")
        let page_five = stb.instantiateViewController(withIdentifier: "walk5")
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.add(viewController:page_one)
        walkthrough.add(viewController:page_two)
        walkthrough.add(viewController:page_three)
        walkthrough.add(viewController:page_four)
        walkthrough.add(viewController:page_five)
        
        self.present(walkthrough, animated: true, completion: nil)
    }
    
    
    // MARK: - Walkthrough delegate -
    
    func walkthroughPageDidChange(_ pageNumber: Int) {
        print("Current Page \(pageNumber)")
    }
    
    func walkthroughCloseButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
