//
//  ConnectMapViewController.swift
//  Week9Tutorial
//
//  Created by Ziyi Deng on 11/5/19.
//  Copyright © 2019 Jason Haasz. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces
import Firebase
import CoreLocation
import Alamofire
import SwiftyJSON
import PopupDialog

class ConnectMapViewController: UIViewController {
    
    
    @IBOutlet weak var rank5: UILabel!
    @IBOutlet weak var rank4: UILabel!
    @IBOutlet weak var rank3: UILabel!
    @IBOutlet weak var rank2: UILabel!
    @IBOutlet weak var rank1: UILabel!
    @IBOutlet weak var rankView: UIView!
    
    var googleMapsView: GMSMapView!
    var resultArray: [String] = []
    var transferArray:[String] = []
    var finalArray:[String] = []
    var latArray:[Double] = []
    var longArray:[Double] = []
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Loading...", comment: "")
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let colourArray = [UIColor(red: 255/255, green: 221/255, blue: 244/255, alpha: 0.5),
                       UIColor(red: 49/255, green: 226/255, blue: 255/255, alpha: 0.5),
                       UIColor(red: 175/255, green: 216/255, blue: 245/255, alpha: 0.5),
                       UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 0.5),
                       UIColor(red: 113/255, green: 188/255, blue: 120/255, alpha: 0.5),
                       UIColor(red: 251/255, green: 206/255, blue: 177/255, alpha: 0.5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialMapView()
        self.googleMapsView.addSubview(self.percentageLabel)
        self.percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.percentageLabel.center = self.view.center
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.position = self.view.center
        
        self.googleMapsView.layer.addSublayer(trackLayer)
        
        self.shapeLayer.path = circularPath.cgPath
        
        self.shapeLayer.strokeColor = UIColor(red: 93/255, green: 75/255, blue: 153/255, alpha: 1).cgColor
        
        self.shapeLayer.lineWidth = 10
        self.shapeLayer.fillColor = UIColor.clear.cgColor
        self.shapeLayer.lineCap = CAShapeLayerLineCap.round
        self.shapeLayer.position = self.view.center
        
        self.shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        self.shapeLayer.strokeEnd = 0
        
        self.googleMapsView.layer.addSublayer(self.shapeLayer)
        
        findSuburb()
        print(finalArray.count)
        var labelArray = [self.rank1,self.rank2,self.rank3,self.rank4,self.rank5]
        
        for i in 0...finalArray.count - 1{
            labelArray[i]?.text = "\(finalArray[i])"
        }
        
//        rank1.text = "Rank 1: \(finalArray[0])"
//        rank2.text = "Rank 2: \(finalArray[1])"
//        rank3.text = "Rank 3: \(finalArray[2])"
//        rank4.text = "Rank 4: \(finalArray[3])"
//        rank5.text = "Rank 5: \(finalArray[4])"
//        rank6.text = "Rank 6: \(finalArray[5])"
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        basicAnimation.duration = CFTimeInterval(finalArray.count * 4)
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        DispatchQueue.main.async {
            self.drawLine()
        }
        
        //rankView?.backgroundColor = UIColor(white: 1, alpha: 0.8)
        
        
    }
    
    let urlString = ""
    
    
    func findSuburb(){
        for i in resultArray {
            let temp = i.split(separator: ",")
            transferArray.append(String(temp[0]).trimmingCharacters(in: .whitespacesAndNewlines))
            transferArray.append(String(temp[1]).trimmingCharacters(in: .whitespacesAndNewlines))
        }
        
        if transferArray.count > 5 {
            for i in 0...4 {
                finalArray.append(transferArray[i])
            }
        }else{
            finalArray = transferArray
        }
    }
    
    func getJson(_ jsonName:String) ->[[String:Any]] {
        let path = Bundle.main.path(forResource: jsonName, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            let jsonDic = jsonData as! Dictionary<String, AnyObject>
            let jsonArray = jsonDic["features"] as! [[String:Any]]
            return jsonArray
        } catch let error as Error? {
            print("An Error Occur",error as Any)
        }
        return [[:]]
    }
    
    func findBoundary(suburb:String){
        var temp:NSArray = []
        for dic:[String:Any] in self.getJson("Boundary") {
            let proper = dic["properties"] as! [String:Any]
            if (proper["VIC_LOCA_2"] as! String == suburb.uppercased()){
                let geo = dic["geometry"] as! [String:Any]
                temp = geo["coordinates"] as! NSArray
            }
        }
        let i = temp[0] as! NSArray
        for j in i{
            let temp = j as! NSArray
            latArray.append(temp[1] as! Double)
            longArray.append(temp[0] as! Double)
        }
    }
    
    func initialMapView(){
        self.googleMapsView = GMSMapView(frame: self.view.bounds)
        self.googleMapsView?.isMyLocationEnabled = true
        let camera = GMSCameraPosition.camera(withLatitude: -37.877632, longitude: 145.044684, zoom: 11.0)
        self.googleMapsView.camera = camera
        self.view.addSubview(self.googleMapsView)
    }
    
    func drawLine(){
        for i in 0...self.finalArray.count - 1 {
            self.latArray.removeAll()
            self.longArray.removeAll()
            self.findBoundary(suburb: self.finalArray[i])
            if self.latArray.count != 0
            {
                let rec = GMSMutablePath()
                for j in 0...self.latArray.count - 1{
                    rec.add(CLLocationCoordinate2D(latitude: self.latArray[j], longitude: self.longArray[j]))
                }
                let polygon = GMSPolygon(path: rec)
                polygon.fillColor = colourArray[i]
                polygon.strokeColor = .black
                polygon.strokeWidth = 1
                polygon.map = self.googleMapsView
                print("done")
                print(self.transferArray[i])
                }
            }
        self.shapeLayer.removeFromSuperlayer()
        self.percentageLabel.removeFromSuperview()
        self.trackLayer.removeFromSuperlayer()
        googleMapsView.addSubview(rankView)
        }
}

