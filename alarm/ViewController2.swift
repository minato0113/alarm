//
//  ViewController2.swift
//  alarm
//
//  Created by 竹内太一 on 2015/08/26.
//  Copyright (c) 2015年 Taichi Takeuchi. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, BEMAnalogClockDelegate {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var analogClock: BEMAnalogClockView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Above Date Label
        let ud = NSUserDefaults.standardUserDefaults()
        let result: AnyObject! = ud.objectForKey("id")
        let time: NSTimeInterval = result as! NSTimeInterval
        let date = NSDate(timeIntervalSince1970: time)
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateStr: String = formatter.stringFromDate(date)
        label.text = dateStr
        
        // Below Analog Clock
        self.setUpAnalogClock(label.text!)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private
    private func setUpAnalogClock(time: String) {
        analogClock.delegate = self
        analogClock.faceBackgroundColor = UIColor.turquoiseColor()
        analogClock.hourHandLength = analogClock.hourHandLength * 1.5
        analogClock.minuteHandLength = analogClock.minuteHandLength * 1.5
        analogClock.secondHandLength = analogClock.secondHandLength * 1.5
        
        var timeArray = time.componentsSeparatedByString(":")
        let hour = timeArray[0] as String
        let minute = timeArray[1] as String
        
        analogClock.hours = Int(hour)!
        analogClock.minutes = Int(minute)!
        analogClock.seconds = 0
    }

}
