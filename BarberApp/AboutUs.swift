//
//  AboutUs.swift
//  BarberApp
//
//  Created by Sunil Kharat on 21/11/2016.
//  Copyright © 2016 Sunil Kharat. All rights reserved.
//

import Foundation
import UIKit

class AboutUs : UIViewController, SideBarDelegate{
    var sideBar:SideBar = SideBar()
    @IBOutlet weak var ChangingImage: UIImageView!
    let text = "AK BARBER MAIDENHEAD is one of the finest barber shops in Maidenhead, Berkshire. On menu is a variety of Haircuts, Shaves and hair groom services to suite your individual needs. We are based in the heart of maidenhead, close to the town centre and a quick walk from the Train Station. \n \nOur Prices are very reasonable with offering from £7 for a Hair cut and £4 for a Bead Trim. We also offer eyebrow trim , beard line up with razor, full head shave and clipper hair cut. Kindly visit the Gallery, Services and Offers page to see a full range our exclusive offerings."
    //@IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    var flag = 0
    
    override func viewDidLoad() {
        sideBar = SideBar(sourceView: self.view, menuItems: ["Home", "Gallery", "Services", "Reviews", "Offers", "About us", "Contact us"])
        sideBar.delegate = self
        
        self.navigationItem.title = "AK Barbers"
        
        ChangingImage.animationImages = [
            UIImage(named: "Aboutus1.jpg")!,
            UIImage(named: "Aboutus2.jpg")!,
            UIImage(named: "Aboutus3.jpg")!,
            UIImage(named: "Aboutus4.jpg")!]
        
        ChangingImage.animationDuration = 25.0
        ChangingImage.startAnimating()
        
        self.ChangingImage.layer.cornerRadius = 10
        self.ChangingImage.layer.borderWidth = 0.2
        self.ChangingImage.layer.masksToBounds = true
        self.ChangingImage.layer.borderColor = UIColor.black.cgColor
        
        self.Description.layer.cornerRadius = 5
        self.Description.layer.borderWidth = 1.0
        self.Description.layer.masksToBounds = true
        self.Description.layer.borderColor = UIColor.white.cgColor
        
        Description.text = self.text
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
            sideBar.showSideBar(false)
        }else if index == 6{
            let viewController6 = self.storyboard?.instantiateViewController(withIdentifier: "Contactus") as! Contactus
            let navController = UINavigationController(rootViewController: viewController6)
            self.present(navController, animated:true, completion: nil)
        }
    }

}
