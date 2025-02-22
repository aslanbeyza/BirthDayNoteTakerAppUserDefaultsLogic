//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Beyza Aslan on 22.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextFile: UITextField!
    @IBOutlet weak var birthdayTextFile: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
//App acılınca ilk olan şey
    override func viewDidLoad() {
        super.viewDidLoad()
//açıldıgı gibi verileri çekmem lazım userDefaultsdan ki ekranda göreyim ya o yüzden didload da yapıcaz
      let storedname = UserDefaults.standard.object(forKey: "name")
      let storedbirthday = UserDefaults.standard.object(forKey: "birthday")
        
      if let newName = storedname as? String {
          nameLabel.text = "Name:\(newName)"
        }
        if let newBirthday = storedbirthday as? String {
            birthdayLabel.text = "Birthday:\(newBirthday)"
          }
      
    }
    
    @IBAction func saveClicked(_ sender: Any) {
      //butona tıklanınca ne olucak
        
        UserDefaults.standard.set(nameTextFile.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextFile.text, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameTextFile.text!)"
        birthdayLabel.text = "Birthday: \( birthdayTextFile.text!)"
    }
// delete button
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedbirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if storedName as? String != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name"
        }
        if (storedbirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "BirthDay:"
        }
    }
    
    
    
}

