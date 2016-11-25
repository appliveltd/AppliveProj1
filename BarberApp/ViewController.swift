//
//  ViewController.swift
//  BarberApp
//
//  Created by Training on 01/09/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SideBarDelegate {
    
    @IBOutlet weak var Heading: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var Heading2: UILabel!
    var flag = 0
//    @IBOutlet var imageView: UIImageView!
    
    var sideBar:SideBar = SideBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "AK Barbers"
        
        Heading.text = "AK Barbers"
        Heading2.text = "Maidenhead"
        imageView.image = UIImage(named: "BarberRolling3.jpg")
        sideBar = SideBar(sourceView: self.view, menuItems: ["Home", "Gallery", "Services", "Reviews", "Offers", "About us", "Contact us"])
        sideBar.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            sideBar.showSideBar(false)
        } else if index == 1{
            let viewController1 = self.storyboard?.instantiateViewController(withIdentifier: "Gallery") as! Gallery
            let navController = UINavigationController(rootViewController: viewController1)
            self.present(navController, animated:true, completion: nil)
        }else if index == 2{
            let viewController2 = self.storyboard?.instantiateViewController(withIdentifier: "RateCard") as! RateCard
            let navController = UINavigationController(rootViewController: viewController2)
            self.present(navController, animated:true, completion: nil)
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

