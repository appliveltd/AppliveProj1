//
//  RateCard.swift
//  BarberApp
//
//  Created by Sunil Kharat on 20/11/2016.
//  Copyright © 2016 Sunil Kharat. All rights reserved.
//

import Foundation
import UIKit

class RateCard : UIViewController, SideBarDelegate{
    var sideBar:SideBar = SideBar()
    var flag = 0
    override func viewDidLoad() {
        sideBar = SideBar(sourceView: self.view, menuItems: ["Home", "Gallery", "Services", "Reviews", "Offers", "About us", "Contact us"])
        sideBar.delegate = self
        
        self.navigationItem.title = "AK Barbers"
        
      //  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ratecard2.JPG")!)
        
     //   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Menu_Page.jpg")!)
    }
    
    @IBAction func MenuClick(_ sender: Any) {
        if(flag==0){
            sideBar.showSideBar(true)
            flag = 1
        }else if(flag==1){
            sideBar.showSideBar(false)
            flag = 0
        }
    }
    
    
    func sideBarDidSelectButtonAtIndex(_ index: Int) {
        if index == 0{
            let viewController0 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let navController = UINavigationController(rootViewController: viewController0)
            self.present(navController, animated:true, completion: nil)
        } else if index == 1{
            let viewController1 = self.storyboard?.instantiateViewController(withIdentifier: "Gallery") as! Gallery
            let navController = UINavigationController(rootViewController: viewController1)
            self.present(navController, animated:true, completion: nil)
        }else if index == 2{
            sideBar.showSideBar(false)
        }else if index == 3{
            //            let viewController3 = self.storyboard?.instantiateViewController(withIdentifier: "Reviews") as! Reviews
            //            let navController = UINavigationController(rootViewController: viewController3)
            //            self.present(navController, animated:true, completion: nil)
        }else if index == 4{
            //            let viewController4 = self.storyboard?.instantiateViewController(withIdentifier: "Offers") as! Offers
            //            let navController = UINavigationController(rootViewController: viewController4)
            //            self.present(navController, animated:true, completion: nil)
        }else if index == 5{
            let viewController5 = self.storyboard?.instantiateViewController(withIdentifier: "AboutUs") as! AboutUs
            let navController = UINavigationController(rootViewController: viewController5)
            self.present(navController, animated:true, completion: nil)
        }else if index == 6{
            let viewController6 = self.storyboard?.instantiateViewController(withIdentifier: "Contactus") as! Contactus
            let navController = UINavigationController(rootViewController: viewController6)
            self.present(navController, animated:true, completion: nil)
        }
    }


}
