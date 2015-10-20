//
//  ViewController.swift
//  com.ramirez-portfolio.gestures
//
//  Created by Rene Ramirez on 2015-10-19.
//  Copyright © 2015 Rene Ramirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var imageBigView: SpringImageView!
  var position = 0;
  var maxPosition = 0;
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let tap = UITapGestureRecognizer(target: self, action: "tapHandler:")
    imageBigView.addGestureRecognizer(tap);
    
    let rightSwipe = UISwipeGestureRecognizer(target: self, action: "swipeHandler:");
    imageBigView.addGestureRecognizer(rightSwipe)
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: "swipeHandler:");
    leftSwipe.direction = .Left;
    imageBigView.addGestureRecognizer(leftSwipe)
    maxPosition = foodsData.count
    changeBigLayout()
  }

  func tapHandler(sender:UITapGestureRecognizer){
    print("Tap");
  }
  
  func swipeHandler(sender:UISwipeGestureRecognizer){
    switch sender.direction {
     case UISwipeGestureRecognizerDirection.Left:
        position--
        imageBigView.animation = "squeezeLeft";
        imageBigView.curve = "spring"
        imageBigView.duration = 1.0
        imageBigView.scaleX = 3.0
        imageBigView.scaleY = 3.0
        imageBigView.animate()
        if(position<0){
          position = maxPosition - 1
        }
      
      case UISwipeGestureRecognizerDirection.Right:
        position++
        imageBigView.animation = "squeezeRight";
        imageBigView.curve = "spring"
        imageBigView.duration = 1.0
        imageBigView.scaleX = 3.0
        imageBigView.scaleY = 3.0
        imageBigView.animate()
        if(position >= maxPosition ){
          position = 0;
        }
        
      default:
        print("DEFAULT")
    }
   changeBigLayout()
  }
  
  func changeBigLayout(){
    imageBigView.image = UIImage(named: foodsData[position].photo!)
    titleLabel.text = foodsData[position].name
    descriptionLabel.text = foodsData[position].description
    priceLabel.text = foodsData[position].price
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

