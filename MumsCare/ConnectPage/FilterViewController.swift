//
//  FilterViewController.swift
//  Week9Tutorial
//
//  Created by Ziyi Deng on 10/5/19.
//  Copyright © 2019 Jason Haasz. All rights reserved.
//

import UIKit
import PopupDialog
import ZKCarousel


class FilterViewController: UIViewController {

    @IBOutlet weak var englishField: UITextField!
    @IBOutlet weak var languageField: UITextField!
    @IBOutlet var carousel: ZKCarousel! = ZKCarousel()
    var populationArray: [String] = []
    var languageArray: [String] = []
    var englishArray: [String] = []
    var intersection: Set<String> = []
    var suburbArray: [String] = []
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    private func setupCarousel() {
        
        // Create as many slides as you'd like to show in the carousel
        let slide = ZKCarouselSlide(image: #imageLiteral(resourceName: "connect1"), title: "",  description: NSLocalizedString("Connecting to the same culturally rich community can imbibe the cultural values in your kids and keep them related to their own culture", comment: ""))
        let slide1 = ZKCarouselSlide(image: #imageLiteral(resourceName: "connect2"), title: "", description: NSLocalizedString("Reconnecting to your culture can enrich your sense of self-identity and overall wellbeing", comment: ""))
        let slide2 = ZKCarouselSlide(image: #imageLiteral(resourceName: "connect3"), title: "", description: NSLocalizedString("Learning from the experiences to relate more effectively across cultural lines can boost your self-confidence to socialize with other cultures", comment: ""))
        
        
        // Add the slides to the carousel
        self.carousel.slides = [slide, slide1, slide2]
        
        
        // You can optionally use the 'interval' property to set the timing for automatic slide changes. The default is 1 second.
        self.carousel.interval = 8
        
        // Optional - automatic switching between slides.
        self.carousel.start()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        populationArray.removeAll()
        englishArray.removeAll()
        languageArray.removeAll()
        suburbArray.removeAll()
        intersection.removeAll()
        
        if populationField.text != "" || englishField.text != "" || languageField.text != ""{
            switch populationField.text {
            case "More":
                for dic:[String:Any] in self.getJson("Population") {
                    if (dic["Population"]!) as! Double >= 3.0 {
                        self.populationArray.append(dic["Name"] as! String)
                    }
                }
                //print(self.populationArray)
            case "Less":
                for dic:[String:Any] in self.getJson("Population") {
                    if ((dic["Population"]!) as! Double) < 3.0 {
                        self.populationArray.append(dic["Name"] as! String)
                    }
                }
                
            case "较多":
                for dic:[String:Any] in self.getJson("Population") {
                    if (dic["Population"]!) as! Double >= 3.0 {
                        self.populationArray.append(dic["Name"] as! String)
                    }
                }
            //print(self.populationArray)
            case "较少":
                for dic:[String:Any] in self.getJson("Population") {
                    if ((dic["Population"]!) as! Double) < 3.0 {
                        self.populationArray.append(dic["Name"] as! String)
                    }
                }
                //print(self.populationArray)
                
            default:
                print("Some other character")
            }
            
            switch languageField.text {
            case "Mandarin":
                let array = findTopThree(jsonName: "Language", attribute: "Mandarin")
                for dic:[String:Any] in self.getJson("Language"){
                    for i in array{
                        if dic["Mandarin"]! as! Double == i{
                            languageArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.languageArray)
                
            case "Cantonese":
                let array = findTopThree(jsonName: "Language", attribute: "Cantonese")
                for dic:[String:Any] in self.getJson("Language"){
                    for i in array{
                        if dic["Cantonese"]! as! Double == i{
                            languageArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.languageArray)
            case "Other Chinese language":
                let array = findTopThree(jsonName: "Language", attribute: "Chinese nfd")
                for dic:[String:Any] in self.getJson("Language"){
                    for i in array{
                        if dic["Chinese nfd"]! as! Double == i{
                            languageArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.languageArray)
            case "English Only":
                let array = findTopThree(jsonName: "Language", attribute: "English only")
                for dic:[String:Any] in self.getJson("Language"){
                    for i in array{
                        if dic["English only"]! as! Double == i{
                            languageArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.languageArray)
            case "普通话":
                let array = findTopThree(jsonName: "Language", attribute: "Mandarin")
                for dic:[String:Any] in self.getJson("Language"){
                    for i in array{
                        if dic["Mandarin"]! as! Double == i{
                            languageArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.languageArray)
                
            case "粤语":
                let array = findTopThree(jsonName: "Language", attribute: "Cantonese")
                for dic:[String:Any] in self.getJson("Language"){
                    for i in array{
                        if dic["Cantonese"]! as! Double == i{
                            languageArray.append(dic["Name"] as! String)
                        }
                    }
                }
            //print(self.languageArray)
            case "其他方言":
                let array = findTopThree(jsonName: "Language", attribute: "Chinese nfd")
                for dic:[String:Any] in self.getJson("Language"){
                    for i in array{
                        if dic["Chinese nfd"]! as! Double == i{
                            languageArray.append(dic["Name"] as! String)
                        }
                    }
                }
            //print(self.languageArray)
            case "只说英语":
                let array = findTopThree(jsonName: "Language", attribute: "English only")
                for dic:[String:Any] in self.getJson("Language"){
                    for i in array{
                        if dic["English only"]! as! Double == i{
                            languageArray.append(dic["Name"] as! String)
                        }
                    }
                }
                
            default:
                print("Some other character")
            }
            
            switch englishField.text {
            case "Excellent":
                let array = findTopThree(jsonName: "Proficiency", attribute: "Very well")
                for dic:[String:Any] in self.getJson("Proficiency"){
                    for i in array{
                        if dic["Very well"]! as! Double == i{
                            englishArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.englishArray)
                
            case "Good":
                let array = findTopThree(jsonName: "Proficiency", attribute: "Well")
                for dic:[String:Any] in self.getJson("Proficiency"){
                    for i in array{
                        if dic["Well"]! as! Double == i{
                            englishArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.englishArray)
                
            case "Average":
                let array = findTopThree(jsonName: "Proficiency", attribute: "Not well")
                for dic:[String:Any] in self.getJson("Proficiency"){
                    for i in array{
                        if dic["Not well"]! as! Double == i{
                            englishArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.englishArray)
                
            case "Poor":
                
                let array = findTopThree(jsonName: "Proficiency", attribute: "Not at all")
                for dic:[String:Any] in self.getJson("Proficiency"){
                    for i in array{
                        if dic["Not at all"]! as! Double == i{
                            englishArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.englishArray)
            case "非常熟练":
                let array = findTopThree(jsonName: "Proficiency", attribute: "Very well")
                for dic:[String:Any] in self.getJson("Proficiency"){
                    for i in array{
                        if dic["Very well"]! as! Double == i{
                            englishArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.englishArray)
                
            case "熟练":
                let array = findTopThree(jsonName: "Proficiency", attribute: "Well")
                for dic:[String:Any] in self.getJson("Proficiency"){
                    for i in array{
                        if dic["Well"]! as! Double == i{
                            englishArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.englishArray)
                
            case "平均":
                let array = findTopThree(jsonName: "Proficiency", attribute: "Not well")
                for dic:[String:Any] in self.getJson("Proficiency"){
                    for i in array{
                        if dic["Not well"]! as! Double == i{
                            englishArray.append(dic["Name"] as! String)
                        }
                    }
                }
                //print(self.englishArray)
                
            case "较差":
                
                let array = findTopThree(jsonName: "Proficiency", attribute: "Not at all")
                for dic:[String:Any] in self.getJson("Proficiency"){
                    for i in array{
                        if dic["Not at all"]! as! Double == i{
                            englishArray.append(dic["Name"] as! String)
                        }
                    }
                }
                
            default:
                print("Some other character")
            }
            
            self.intersection = findIntersection()
            
            if (self.intersection.count == 0){
                let title = NSLocalizedString("No Exact Matches", comment: "")
                
                let message = NSLocalizedString("Try tweaking your search results criteria for more results", comment: "")
                
                let image = UIImage.init(named: "noresult")
                
                // Create the dialog
                let popup = PopupDialog(title: title, message: message, image: image, preferredWidth: 580)
                
                // Create first button
                let buttonOne = DefaultButton(title: NSLocalizedString("OK", comment: "")) {
                    return
                }
                // Add buttons to dialog
                popup.addButtons([buttonOne])
                // Present dialog
                self.present(popup, animated: true, completion: nil)
                
            }
            else{
                
                for dic:[String:Any] in self.getJson("Suburb"){
                    for i in intersection{
                        if (dic["Name"]!) as! String == i {
                            self.suburbArray.append(dic["Suburbs"] as! String)
                        }
                    }
                    
                }
                
                self.performSegue(withIdentifier: "connectResult", sender: self)
            }
        }
        else{
            let alert = UIAlertController(title: NSLocalizedString("Sorry", comment: ""), message: NSLocalizedString("You must select at least one option", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var populationField: UITextField!
    
    func findTopThree(jsonName:String, attribute:String) -> [Double]{
        var tempArray:[Double] = []
        for dic:[String:Any] in self.getJson(jsonName) {
            tempArray.append(dic[attribute]! as! Double)
        }
        tempArray.sort()
//        return tempArray
        return [tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!,tempArray.popLast()!]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup
        self.setupCarousel()
        
        populationField.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        languageField.addTarget(self, action: #selector(selectLanguageFunction), for: .touchDown)
        englishField.addTarget(self, action: #selector(selectEnglishFunction), for: .touchDown)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func selectLanguageFunction(textField: UITextField) {
        let title = NSLocalizedString("Langugage", comment: "")
        
        let message = NSLocalizedString("Find a suburb where Chinese people speaks:", comment: "")
        
        let image = UIImage.init(named: "selection2")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image, preferredWidth: 580)
        
        // Create first button
        let buttonOne = DefaultButton(title: NSLocalizedString("Mandarin", comment: "")) {
            self.languageField.text = NSLocalizedString("Mandarin", comment: "")
        }
        
        let buttonTwo = DefaultButton(title: NSLocalizedString("Cantonese", comment: "")) {
            self.languageField.text = NSLocalizedString("Cantonese", comment: "")
        }
        
        let buttonThree = DefaultButton(title: NSLocalizedString("Other Chinese language", comment: "")) {
            self.languageField.text = NSLocalizedString("Other Chinese language", comment: "")
        }
        
        let buttonFour = DefaultButton(title: NSLocalizedString("English Only", comment: "")) {
            self.languageField.text = NSLocalizedString("English Only", comment: "")
        }
        
        let buttonFive = CancelButton(title: NSLocalizedString("Cancel", comment: "")) {
            self.languageField.placeholder = NSLocalizedString("Tap to Select", comment: "")
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
    @objc func selectEnglishFunction(textField: UITextField) {
        let title = NSLocalizedString("English Proficiency", comment: "")
        
        let message = NSLocalizedString("Find the suburb where the Chinese people's proficiency is:", comment: "")
        
        let image = UIImage.init(named: "selection3")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image, preferredWidth: 580)
        
        // Create first button
        let buttonOne = DefaultButton(title: NSLocalizedString("Excellent", comment: "")) {
            self.englishField.text = NSLocalizedString("Excellent", comment: "")
        }
        
        let buttonTwo = DefaultButton(title: NSLocalizedString("Good", comment: "")) {
            self.englishField.text = NSLocalizedString("Good", comment: "")
        }
        
        let buttonThree = DefaultButton(title: NSLocalizedString("Average", comment: "")) {
            self.englishField.text = NSLocalizedString("Average", comment: "")
        }
        
        let buttonFour = DefaultButton(title: NSLocalizedString("Poor", comment: "")) {
            self.englishField.text = NSLocalizedString("Poor", comment: "")
        }
        
        let buttonFive = CancelButton(title: NSLocalizedString("Cancel", comment: "")) {
            self.englishField.placeholder = NSLocalizedString("Tap to Select", comment: "")
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
    @objc func myTargetFunction(textField: UITextField) {
        let title = NSLocalizedString("Chinese Population", comment: "")
        
        let message = NSLocalizedString("Find a suburb where the number of Chinese people is:", comment: "")
        
        let image = UIImage.init(named: "selection1")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image, preferredWidth: 580)
        
        // Create first button
        let buttonOne = DefaultButton(title: NSLocalizedString("More", comment: "")) {
            self.populationField.text = NSLocalizedString("More", comment: "")
        }
        
        let buttonTwo = DefaultButton(title: NSLocalizedString("Less", comment: "")) {
            self.populationField.text = NSLocalizedString("Less", comment: "")
        }
        
        
        let buttonFour = CancelButton(title: NSLocalizedString("Cancel", comment: "")) {
            self.populationField.placeholder = NSLocalizedString("Tap to Select", comment: "")
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo, buttonFour])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
    func getJson(_ jsonName:String) ->[[String:Any]] {
        let path = Bundle.main.path(forResource: jsonName, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            let jsonArr = jsonData as! [[String:Any]]
            return jsonArr
        } catch let error as Error? {
            print("An Error Occur",error as Any)
        }
        return [[:]]
    }

    func findIntersection() -> Set<String> {
        let set1:Set<String> = Set(populationArray)
        let set2:Set<String> = Set(englishArray)
        let set3:Set<String> = Set(languageArray)
        
        if populationArray.count != 0 && englishArray.count != 0 && languageArray.count != 0{
            return set1.intersection(set2).intersection(set3)
        }
        else if populationArray.count != 0 && englishArray.count != 0 && languageArray.count == 0{
            return set1.intersection(set2)
        }
        else if populationArray.count != 0 && englishArray.count == 0 && languageArray.count != 0{
            return set1.intersection(set3)
        }
        else if populationArray.count == 0 && englishArray.count != 0 && languageArray.count != 0{
            return set2.intersection(set3)
        }
        else if populationArray.count != 0 && englishArray.count == 0 && languageArray.count == 0{
            return set1
        }
        else if populationArray.count == 0 && englishArray.count != 0 && languageArray.count == 0{
            return set2
        }
        else {
            return set3
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "connectResult") {
            //Checking identifier is crucial as there might be multiple
            // segues attached to same view
            let cmapVC = segue.destination as! ConnectMapViewController;
            cmapVC.resultArray = suburbArray
        }
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
