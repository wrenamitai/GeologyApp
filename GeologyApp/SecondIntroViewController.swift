//
//  SecondIntroViewController.swift
//  GeologyApp
//
//  Created by Wren Amitai on 7/12/19.
//  Copyright © 2019 Wren Amitai. All rights reserved.
//

import UIKit
import ButtonAppearance

class SecondIntroViewController: UIViewController {
    @IBOutlet weak var headLabel: UIButton!
    @IBOutlet weak var bodyLabel: UIButton!
    @IBOutlet weak var completeLabel: UIButton!
    
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var bodyImage: UIImageView!
    var buttonSpecs : UIButton = UIButton.init();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fakeMuseumBR")!);
        headLabel.setTitle("Pick a head", for: .normal);
         bodyLabel.setTitle("...then pick a body...", for: .normal);
         completeLabel.setTitle("...and your animal is complete!", for: .normal);
        headLabel = formatButtons(button: headLabel);
        bodyLabel = formatButtons(button: bodyLabel);
        completeLabel = formatButtons(button: completeLabel);
        completeLabel.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        headLabel.isHidden = false;
        bodyLabel.isHidden = true;
        completeLabel.isHidden = true;
        headImage.isHighlighted = true;
        // Do any additional setup after loading the view.
        
        
    }
     func formatButtons(button: UIButton) -> UIButton{
        button.titleLabel?.font = buttonSpecs.titleLabel?.font;
        button.backgroundColor = buttonSpecs.backgroundColor;
        print("got here");
        print(buttonSpecs.backgroundColor ?? UIColor.green);
        button.setCornerRadius(Float(buttonSpecs.layer.cornerRadius), borderWidth: Float(buttonSpecs.layer.borderWidth), borderColor: UIColor(cgColor: buttonSpecs.layer.borderColor!));
        print("??");
        button.setTitleColor(UIColor.white, for: .normal)
                return button;
       
    }
    var tapCount : Int = 1;
    @IBAction func tapGesture(_ sender: Any) {
        print(tapCount);
        if (tapCount == 1){
        headLabel.isHidden = true;
        bodyLabel.isHidden = false;
        headImage.isHighlighted = false;
        bodyImage.isHighlighted = true;
        }else if (tapCount == 2){
            bodyLabel.isHidden = true;
            completeLabel.isHidden = false;
            bodyImage.isHighlighted = false;
        }else if (tapCount == 3){
            completeLabel.setTitle("Make sure to use everything you\njust learned about the Ice Age!", for: .normal);
             completeLabel.titleLabel?.numberOfLines = 2
           completeLabel.sizeToFit();
          
        }else{
              performSegue(withIdentifier: "toPickHead", sender: self);
        }
        tapCount = tapCount+1;
    }


   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! PickHeadsController;
        destVC.buttonSpecs = self.buttonSpecs;
    }
    

}
