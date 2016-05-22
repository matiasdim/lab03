//
//  FirstViewController.swift
//  Lab03
//
//  Created by Matías  Gil Echavarría on 5/19/16.
//  Copyright © 2016 Matías Gil Echavarría. All rights reserved.
//

//http://www.iconbeast.com/free/
// http://mybaco.deviantart.com/art/Pack-3-Baco-Flurry-Icon-342386574

import UIKit
import CoreLocation
import Darwin

// I found this nice and single extension to roound Dubles, here: http://stackoverflow.com/a/28652692/2507118 and I edited it to round Up insted to round Down
extension Double {
    var roundTo2:Double {
        let converter = NSNumberFormatter()
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.NoStyle
        formatter.minimumFractionDigits = 2
        formatter.roundingMode = .RoundUp
        formatter.maximumFractionDigits = 2
        if let stringFromDouble =  formatter.stringFromNumber(self) {
            if let doubleFromString = converter.numberFromString( stringFromDouble ) as? Double {
                return doubleFromString
            }
        }
        return 0
    }
}

class FirstViewController: UIViewController {

    @IBOutlet weak var lat1: DecimalMinusTextField!
    @IBOutlet weak var lat2: DecimalMinusTextField!
    @IBOutlet weak var lon1: DecimalMinusTextField!
    @IBOutlet weak var lon2: DecimalMinusTextField!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var bearingLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lat1.clearButtonMode = UITextFieldViewMode.WhileEditing
        self.lat2.clearButtonMode = UITextFieldViewMode.WhileEditing
        self.lon1.clearButtonMode = UITextFieldViewMode.WhileEditing
        self.lon2.clearButtonMode = UITextFieldViewMode.WhileEditing

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        view.endEditing(true)
    }
    
    
    
    @IBAction func calculate(sender: AnyObject) {
        view.endEditing(true)
        if (self.lat1 != "" || self.lat2 != "" || self.lon1 != "" || lat2 != "")
        {
            let lat1 :CLLocationDegrees = Double(self.lat1.text!)!
            let lon1 :CLLocationDegrees = Double(self.lon1.text!)!
            let lat2 :CLLocationDegrees = Double(self.lat2.text!)!
            let lon2 :CLLocationDegrees = Double(self.lon2.text!)!


            let location1 = CLLocation(latitude: lat1, longitude: lon1)
            let location2 = CLLocation(latitude: lat2, longitude: lon2)
            
            let distance :CLLocationDistance = location1.distanceFromLocation(location2)
            let bearing :Double = location1.bearingToPoint(location2)
            
            self.distanceLabel.text = "\((Double(distance) / 1000.0).roundTo2) kilometers"
            self.bearingLabel.text = "\(Double(bearing).roundTo2 / 1) degrees"

        }
    }
    @IBAction func clear(sender: AnyObject) {
        view.endEditing(true)
        self.lat1.text = ""
        self.lat2.text = ""
        self.lon1.text = ""
        self.lon2.text = ""
        self.distanceLabel.text = ""
        self.bearingLabel.text = ""
    }
    
    

}

