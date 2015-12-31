//
//  ViewController.swift
//  TipYourWaiter
//
//  Created by Asha Earle on 12/30/15.
//  Copyright © 2015 Earle, inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BillTextField: UITextField!
    @IBOutlet weak var TipAmountLB: UILabel!
    @IBOutlet weak var TotalAmountLB: UILabel!
    @IBOutlet weak var PercentageAmountUI: UISegmentedControl!
    
    var AshaTip = NSUserDefaults()
    
    @IBAction func onEditingChanged(sender: AnyObject)
    {
        var percentage = [0.18,0.20,0.22]
        var percentageID = percentage[PercentageAmountUI.selectedSegmentIndex]
        
        let billAmount = NSString(string: BillTextField.text!).doubleValue
        let tip = billAmount * percentageID
        let total = billAmount + tip
        
        TipAmountLB.text = String(format: "$%.2f", tip)
        TotalAmountLB.text = String(format: "$%.2f", total)
        //PercentageAmountUI.selectedSegmentIndex = AshaTip.integerForKey("Asha")
        AshaTip.setInteger(PercentageAmountUI.selectedSegmentIndex, forKey: "Asha")
        AshaTip.synchronize()
        
       
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        TipAmountLB.text = "$0.00"
        TotalAmountLB.text = "$0.00"
        
        PercentageAmountUI.selectedSegmentIndex = AshaTip.integerForKey("Asha")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onTapKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

