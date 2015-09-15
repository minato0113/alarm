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
    var checkTime:NSDate!
    var maxNowResult:NSDate!
    var maxTime:NSDate!
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
        
        num = mySelectedDate.toInt()!+1
        num2 = mySelectedDate2.toInt()!+30
        
        if num2 >= 60{
            num2 = num2 - 60
            num = num + 1
        }
        
        label2.text = "\(num):\(num2)"
        
        if num2 <= 9{
            label2.text = "\(num):0\(num2)"
        }
        
        
        dateUnix = sender.date.timeIntervalSince1970
        dateUnix2 = dateUnix+90*60
        
//        let hoge = NSDate(timeIntervalSince1970: dateUnix2)
//        let formatter = NSDateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let dateStr: String = formatter.stringFromDate(hoge)
//
//        println(dateStr)
        
        

/*
        func checkLme (){
            var i : Int=0
            var j : Int=0
            var maxNowResult : NSComparisonResult = .OrderedAscending
            while maxNowResult == NSComparisonResult.OrderedAscending{
                checkTime = NSDate(timeInterval: NSTimeInterval(i*90*60), sinceDate: now)
                maxNowResult = checkTime!.compare(maxTime)
            }
            
        }
*/
        //        println(dateUnix)
    }
    @IBAction func put() {
        var config : NSTimeInterval=0
        
        
        
        println(maxNowResult)
        now = NSDate()
        let nowUnix: NSTimeInterval? = now?.timeIntervalSince1970
        println(nowUnix)
        var roop = nowUnix!+90*60
        let i = nowUnix
        while (config<dateUnix){
            config = config+90*60
        }
        // 「ud」というインスタンスをつくる。
        let ud = NSUserDefaults.standardUserDefaults()
        // キーがidの値をとります。
        var udId : AnyObject! = ud.objectForKey("id")
        // キーidに「taro」という値を格納。（idは任意の文字列でok）
        ud.setObject(config, forKey: "id")
        

        self.performSegueWithIdentifier("toAlarmView", sender: nil)
        
        
    }


    

    
}

