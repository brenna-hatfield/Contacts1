//
//  ViewController.swift
//  Contacts1
//
//  Created by brenna on 10/8/17.
//  Copyright © 2017 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtContacts: UITextView!
    @IBOutlet weak var btnBack: UIButton!
    
    func MsgBox(_ message:String)
    {
        //Create Alert
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        //forces resign first responder and hides keyboard
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
        
        
    }
    
    func DismissKeyboard(){
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        //forces resign first responder and hides keyboard
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool     {
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField:UITextField){
        //Add Below Code from "Code for Steps.txt". Read Comments
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    func textFieldDidEndEditing(_ textField:UITextField){
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func textViewDidBeginEditing(_ textField:UITextView){
        //Add Below Code from "Code for Steps.txt". Read Comments
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    func textViewDidEndEditing(_ textField:UITextView){
        //Add Below Code from "Code for Steps.txt". Read Comments
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        //Adds tap gesture to ScrollView which will call DismissKeyboard and hide keyboard
        ScrollView.addGestureRecognizer(tap)
        //gets ScreenSize of current device
        let size: CGRect = UIScreen.main.bounds
        //Go to left  = 0 pixels, top = 50 pixels, width or device in pixels, height of device in pixels
        ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
        //Set focus on txtFirst
        txtFirst.becomeFirstResponder()
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        //Set ScrollPoint and Go to ZERO location (Top) of ScrollView - animated
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        //set txtFirst as firstresponder
        txtFirst.becomeFirstResponder()
        
    }
    
    
    @IBAction func btnView(_ sender: UIButton) {
        //hide keyboard
        DismissKeyboard()
        
        //declare CGPoint scrollPoint
        var scrollPoint:CGPoint
        
        //X = from Left, Y = from Top
        //get X = 0, Y = location of btnBack Y
        scrollPoint = CGPoint(x: 0, y: btnBack.frame.origin.y)
        
        //Set ScrollPoint and Go to animated
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        //hide keyboard
        DismissKeyboard()
        
        //validation that all fields are entered
        if (txtFirst.text=="" || txtLast.text=="" || txtAddress.text=="" || txtCity.text=="" || txtState.text=="" || txtZip.text=="" || txtPhone.text=="" || txtEmail.text=="")
        {
            //Call MessageBox if any fields are empty
            MsgBox("All fields required, please correct")
        }
        else
        {
            
            //Check if txtContacts (UITextView) is empty
            if (txtContacts.text=="")
            {
                //if empty then add text and newline
                txtContacts.text = "MyContacts \n"
            }
            //format text
            
            //existing contents of txtContacts, newline, txtFirst, newline, txtLast, newline, txtEmail, newline
            txtContacts.text = "\(txtContacts.text!) \n\(txtFirst.text!) \n\(txtLast.text!) \n\(txtAddress.text!) \n\(txtCity.text!) \n\(txtState.text!) \n\(txtZip.text!) \n\(txtPhone.text!) \n\(txtEmail.text!)\n" //clear textboxes
            txtFirst.text = ""
            txtLast.text = ""
            txtAddress.text = ""
            txtCity.text = ""
            txtState.text = ""
            txtZip.text = ""
            txtPhone.text = ""
            txtEmail.text = ""
            //load scrollview
            
            //declare CGPoint scrollPoint
            
            var scrollPoint:CGPoint
            
            //X = from Left, Y = from Top
            //get X = 0, Y = location of btnBack Y
            scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
            //Set ScrollPoint and Go to animated
            ScrollView.setContentOffset(scrollPoint, animated: true)
            
        }
    }
    
}

