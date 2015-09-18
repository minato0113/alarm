//
//  ViewController.swift
//  alarm
//
//  Created by 竹内太一 on 2015/08/26.
//  Copyright (c) 2015年 Taichi Takeuchi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var myDatePicker:UIDatePicker!
    @IBOutlet var label : UILabel!
    @IBOutlet var label2 : UILabel!
    var num:Int = 0
    var num2:Int = 0
    
    var now :NSDate!

    var dateUnix:NSTimeInterval=0
    var dateUnix2:NSTimeInterval=0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDatePicker.addTarget(self, action: "onDidChangeDate:", forControlEvents: .ValueChanged)
        
    }
    
    //    func nowTime(){
    //        now = NSDate()
    //
    //        // Do any additional setup after loading the view, typically from a nib.
    //        myDatePicker.addTarget(self, action: "onDidChangeDate:", forControlEvents: .ValueChanged)
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    internal func onDidChangeDate(sender: UIDatePicker){
        
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        let myDateFormatter1: NSDateFormatter = NSDateFormatter()
        
        myDateFormatter.dateFormat = "hh"
        myDateFormatter1.dateFormat = "mm"
        
        
        let mySelectedDate: String = myDateFormatter.stringFromDate(sender.date)
        let mySelectedDate2: String = myDateFormatter1.stringFromDate(sender.date)
        
        
        label.text = mySelectedDate + ":" + mySelectedDate2
        
        num = Int(mySelectedDate)!+1
        num2 = Int(mySelectedDate2)!+30
        
        dateUnix = sender.date.timeIntervalSince1970
        dateUnix2 = dateUnix+90*60
        
        
        if num2 >= 60{
            num2 = num2 - 60
            num = num + 1
        }
        
        label2.text = "\(num):\(num2)"
        
        if num2 <= 9{
            label2.text = "\(num):0\(num2)"
        }
        
        
        
    }
    @IBAction func put() {
        
        now = NSDate()
        let nowUnix: NSTimeInterval? = now?.timeIntervalSince1970
        var config : NSTimeInterval = nowUnix!
        print(nowUnix)
        
        while config<dateUnix2 {
            config = config+90*60
            if config>dateUnix {
                break
            }
            
        }
        // 「ud」というインスタンスをつくる。
        let ud = NSUserDefaults.standardUserDefaults()
        // キーがidの値をとります。
        var udId : AnyObject! = ud.objectForKey("id")
        // キーidに「taro」という値を格納。（idは任意の文字列でok）
        ud.setObject(config, forKey: "id")
        
        self.performSegueWithIdentifier("toAlarmView", sender: nil)
        
        
        let date = NSDate(timeIntervalSince1970: config)
        
        // NSDate型を日時文字列に変換するためのNSDateFormatterを生成
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        
        // NSDateFormatterを使ってNSDate型 "date" を日時文字列 "dateString" に変換
        let dateString: String = formatter.stringFromDate(date)
        
        
        print(dateUnix2)
        
    }
    
    
    
    
    
}

