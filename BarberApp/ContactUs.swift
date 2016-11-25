//
//  Contact us.swift
//  BarberApp
//
//  Created by Sunil Kharat on 13/11/2016.
//  Copyright © 2016 Sunil Kharat. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Contactus : UIViewController, SideBarDelegate {
    // @IBOutlet var Map: MKMapView!
    // @IBOutlet weak var Address: UILabel!
    var sideBar:SideBar = SideBar()
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var Address: UILabel!
    var flag = 0
    
    
    let text = "AK’s Barber \n85 Queen Street \nMaidenhead SL6 1LR"
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "AK Barbers"
        
        sideBar = SideBar(sourceView: self.view, menuItems: ["Home", "Gallery", "Services", "Reviews", "Offers", "About us", "Contact us"])
        sideBar.delegate = self
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ContactUsImage2.jpg")!)
        
        let Location = CLLocationCoordinate2DMake(51.52028819, -0.72073102)
        
        let span = MKCoordinateSpanMake(0.002, 0.002)
        
        let region = MKCoordinateRegion(center: Location, span: span)
        
        Map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = Location
        annotation.title = "AK Barbers"
        
        Map.addAnnotation(annotation)
        
        self.Address.layer.cornerRadius = 5
        self.Address.layer.borderWidth = 1.0
        self.Address.layer.masksToBounds = true
        self.Address.layer.borderColor = UIColor.gray.cgColor
        
        Address.text = self.text
        
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
            let viewController5 = self.storyboard?.instantiateViewController(withIdentifier: "AboutUs") as! AboutUs
            let navController = UINavigationController(rootViewController: viewController5)
            self.present(navController, animated:true, completion: nil)
        }else if index == 6{
            sideBar.showSideBar(false)
        }
    }
    
    
    
    @IBAction func Callus(_ sender: UIButton) {
        if let url = NSURL(string: "telprompt://07405078707"){
            UIApplication.shared.openURL(url as URL)
        }
        
    }
    
    
    @IBAction func FacebookLike(_ sender: UIButton) {
        
        let fbURLWeb: NSURL = NSURL(string: "https://www.facebook.com/Akbarbermaidenhead/")!
        let fbURLID: NSURL = NSURL(string: "fb://profile/555353397972446")!
        
        if(UIApplication.shared.canOpenURL(fbURLID as URL)){
            UIApplication.shared.openURL(fbURLID as URL)
        }else{
            UIApplication.shared.openURL(fbURLWeb as URL)
        }
        
    }
    
    
    
}
