//
//  Gallery.swift
//  BarberApp
//
//  Created by Sunil Kharat on 20/11/2016.
//  Copyright © 2016 Sunil Kharat. All rights reserved.
//

import UIKit
import Foundation

class Gallery: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, SideBarDelegate {
    var sideBar:SideBar = SideBar()
    var ImageData: [String] = ["Style1.jpg",  "Style2.jpg", "Style3.jpg", "Style4.jpg", "Style5.jpg", "Style6.jpg", "Style7.jpg", "Style8.jpg", "Style9.jpg", "Style10.jpg", "Style11.jpg", "Style12.jpg", "Style14.jpg", "Style15.jpg"]
    var flag = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "AK Barbers"
        
 

        sideBar = SideBar(sourceView: self.view, menuItems: ["Home", "Gallery", "Services", "Reviews", "Offers", "About us", "Contact us"])
        sideBar.delegate = self
        
       // self.view.backgroundColor = UIColor.darkGray

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: Styles = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Styles
        cell.ImageCell.image = UIImage(named: ImageData[indexPath.row])
        
        return cell
        
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
    func sideBarDidSelectButtonAtIndex(_ index: Int) {
        if index == 0{
            let viewController0 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let navController = UINavigationController(rootViewController: viewController0)
            self.present(navController, animated:true, completion: nil)
        } else if index == 1{
            sideBar.showSideBar(false)
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
