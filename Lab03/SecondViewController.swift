//
//  SecondViewController.swift
//  Lab03
//
//  Created by Matías  Gil Echavarría on 5/19/16.
//  Copyright © 2016 Matías Gil Echavarría. All rights reserved.
//
//  ************************************************
//  ******** Authors: Matias Gil - Vinvith Mudugonda
//  ************************************************

import UIKit
import CoreLocation

// I found this nice and single extension to roound Dubles, here: http://stackoverflow.com/a/28652692/2507118 and I edited it to round Up insted to round Down
extension Double {
    var roundTo5:Double {
        let converter = NSNumberFormatter()
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.NoStyle
        formatter.minimumFractionDigits = 5
        formatter.roundingMode = .RoundUp
        formatter.maximumFractionDigits = 5
        if let stringFromDouble =  formatter.stringFromNumber(self) {
            if let doubleFromString = converter.numberFromString( stringFromDouble ) as? Double {
                return doubleFromString
            }
        }
        return 0
    }
}


class SecondViewController: UIViewController {

    @IBOutlet weak var startLatitud: DecimalMinusTextField!
    @IBOutlet weak var startLongitud: DecimalMinusTextField!
    @IBOutlet weak var bearing: DecimalMinusTextField!
    @IBOutlet weak var distance: DecimalMinusTextField!
    @IBOutlet weak var endpoint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLatitud.clearButtonMode = UITextFieldViewMode.WhileEditing;
        self.startLongitud.clearButtonMode = UITextFieldViewMode.WhileEditing;
        self.bearing.clearButtonMode = UITextFieldViewMode.WhileEditing;
        self.distance.clearButtonMode = UITextFieldViewMode.WhileEditing;
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
        let lat1 :CLLocationDegrees = Double(self.startLatitud.text!)!
        let lon1 :CLLocationDegrees = Double(self.startLongitud.text!)!
        
        
        let location = CLLocation(latitude: lat1, longitude: lon1)
        
        let endpoint :CLLocation = location.findingPoint(Double(self.bearing.text!)!, atDistance: Double(self.distance.text!)!)
        self.endpoint.text = "(\(Double(endpoint.coordinate.latitude).roundTo5),\(Double(endpoint.coordinate.longitude).roundTo5))"

        
    }
    @IBAction func clear(sender: AnyObject) {
        view.endEditing(true)
        self.startLatitud.text = ""
        self.startLongitud.text = ""
        self.bearing.text = ""
        self.distance.text = ""
        self.endpoint.text = ""
    }

}

