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
    @IBOutlet var baseView: UIView!
    @IBOutlet var sleepButton: FUIButton!
    var num: Int = 0
    var num2: Int = 0
    
    var now: NSDate!

    var dateUnix: NSTimeInterval=0
    var dateUnix2: NSTimeInterval=0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FIXME: AM/PM表記を削除
        let locale = NSLocale(localeIdentifier: "ja_JP")
        myDatePicker.locale = locale
        
        // FIXME: 現在より前の時間が指定できないように設定
        myDatePicker.minimumDate = NSDate()
        myDatePicker.addTarget(self, action: "onDidChangeDate:", forControlEvents: .ValueChanged)
        myDatePicker.backgroundColor = UIColor.whiteColor()
        
        self.setUpNavigationBar()
        self.setUpButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.turquoiseColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    }
    
    private func setUpButton() {
        sleepButton.buttonColor = UIColor.turquoiseColor();
        sleepButton.shadowColor = UIColor.greenSeaColor();
        sleepButton.shadowHeight = 3.0;
        sleepButton.cornerRadius = 6.0;
        sleepButton.titleLabel!.font = UIFont.boldFlatFontOfSize(16)
        sleepButton.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        sleepButton.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Highlighted)
        label.sendSubviewToBack(baseView)
    }
    
    internal func onDidChangeDate(sender: UIDatePicker){
        
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        let myDateFormatter1: NSDateFormatter = NSDateFormatter()
        
        myDateFormatter.dateFormat = "hh"
        myDateFormatter1.dateFormat = "mm"
        
        
//        myDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        let mySelectedDate: String = myDateFormatter.stringFromDate(sender.date)
        let mySelectedDate2: String = myDateFormatter1.stringFromDate(sender.date)
        
        //
        print(mySelectedDate)
        
        label.text = mySelectedDate + ":" + mySelectedDate2
        
        num = Int(mySelectedDate)!+1
        num2 = Int(mySelectedDate2)!+30
        
        dateUnix = sender.date.timeIntervalSince1970
        dateUnix2 = dateUnix+90*60
        
        
        if num2 >= 60 {
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
        
        while config < dateUnix2 {
            config = config + 90 * 60
            if config > dateUnix {
                break
            }
            
        }
        
        // 「ud」というインスタンスをつくる。
        let ud = NSUserDefaults.standardUserDefaults()
        // キーがidの値をとります。
        let udId : AnyObject! = ud.objectForKey("id")

        
        // キーidに「taro」という値を格納。（idは任意の文字列でok）
        ud.setObject(config, forKey: "id")
        
        self.performSegueWithIdentifier("toAlarmView", sender: nil)
        
        
        let date = NSDate(timeIntervalSince1970: config)
        
        // NSDate型を日時文字列に変換するためのNSDateFormatterを生成
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        
        // NSDateFormatterを使ってNSDate型 "date" を日時文字列 "dateString" に変換
        let dateString: String = formatter.stringFromDate(date)
        print(dateString)
    }
    
}

