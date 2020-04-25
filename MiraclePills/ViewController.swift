//
//  ViewController.swift
//  MiraclePills
//
//  Created by Yug Rawal on 23/04/20.
//  Copyright © 2020 Yug Rawal. All rights reserved.
//

import UIKit
extension UIViewController {
func dismissKey()
{
let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
}
@objc func dismissKeyboard()
{
view.endEditing(true)
}
}
class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var submitBtn: UIButton!
    let states=["Ontario","Qubec","Nova Scotia","Alberta"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource=self
        statePicker.delegate=self
        self.dismissKey()
        // Do any additional setup after loading the view.
     //   self.view.backgroundColor=UIColor.purple
    }


    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden=false
        submitBtn.isHidden=true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for:UIControl.State.normal)
        statePicker.isHidden=true
        submitBtn.isHidden=false
    }
}

