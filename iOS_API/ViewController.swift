//
//  ViewController.swift
//  iOS_API
//
//  Created by MacStudent on 2020-01-17.
//  Copyright © 2020 Karan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var cityTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
    }
    
    
    @IBAction func selectCity(_ sender: UIButton) {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityTxt.text!.replacingOccurrences(of: " ", with: "%20"))&appid=617ad664055b1c7cebe17d578fa1116e")!
        
            let task =  URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                }
                else{
                    if let urlContent = data{
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
//                          print(jsonResult)
                            //print(jsonResult["name"] as! String)
                            
                            if let description = ((jsonResult["weather"] as! NSArray)[0] as! NSDictionary)["description"] as? String
                            {
                                print(description)
                                DispatchQueue.main.async {
                                    self.weatherLbl.text=description
                                }
                            }
                        }
                        catch{
                            print(error)
                        }
                       
                    }
                }
            }
            task.resume()
        
    }
    
    
    


}

