//
//  ViewController.swift
//  com.ramirez-portfolio.gestures
//
//  Created by Rene Ramirez on 2015-10-19.
//  Copyright © 2015 Rene Ramirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
  
  @IBOutlet weak var previewImageOne: SpringImageView!
  @IBOutlet weak var previewImageTwo: SpringImageView!
  @IBOutlet weak var previewImageThree: SpringImageView!
  @IBOutlet weak var previewImageFour: SpringImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var imageBigView: SpringImageView!
  var pastPosition = -1;
  var position = 0;
  var maxPosition = 0;
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    addTapGesture(previewImageOne)
    addTapGesture(previewImageTwo)
    addTapGesture(previewImageThree)
    addTapGesture(previewImageFour)
    addTapGesture(imageBigView)
   
    let rightSwipe = UISwipeGestureRecognizer(target: self, action: "swipeHandler:");
    imageBigView.addGestureRecognizer(rightSwipe)
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: "swipeHandler:");
    leftSwipe.direction = .Left;
    imageBigView.addGestureRecognizer(leftSwipe)
    maxPosition = foodsData.count
    changeBigLayout()
  }

  func tapHandler(sender:UITapGestureRecognizer){
    
    if(sender.view?.tag >= 1 && sender.view?.tag <= 4){
      
      position = (sender.view?.tag)! - 1
      changeBigLayout();
    }
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
  
  func addTapGesture(myObjectView:AnyObject)
  {
    let tap = UITapGestureRecognizer(target: self, action: "tapHandler:")
    myObjectView.addGestureRecognizer(tap);
  }
  
  func changeBigLayout(){
    imageBigView.image = UIImage(named: foodsData[position].photo!)
    titleLabel.text = foodsData[position].name
    descriptionLabel.text = foodsData[position].description
    priceLabel.text = foodsData[position].price
    if(pastPosition != position){
      //let pastImagePreview = self.view.viewWithTag(pastPosition+1) as? SpringImageView;
      let imagePreview = self.view.viewWithTag(position+1) as? SpringImageView;
      /*pastImagePreview?.animation = "flipY"
      pastImagePreview?.curve = "spring"
      pastImagePreview?.duration = 0.5
      pastImagePreview?.transform = CGAffineTransformMakeScale(1,1)
      pastImagePreview?.animate()*/
      imagePreview?.animation = "pop"
      imagePreview?.curve = "spring"
      imagePreview?.duration = 1
      //pastImagePreview?.transform = CGAffineTransformMakeScale(1.3,1.3)
      imagePreview?.animate()
      pastPosition = position
      
    }
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

