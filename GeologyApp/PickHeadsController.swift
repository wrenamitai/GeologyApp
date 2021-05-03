//
//  PickHeadsController.swift
//  GeologyApp
//
//  Created by Wren Amitai on 7/12/19.
//  Copyright © 2019 Wren Amitai. All rights reserved.
//

import UIKit

class PickHeadsController: UIViewController {

    @IBOutlet weak var partOneButton: UIButton!
    @IBOutlet weak var partTwoButton: UIButton!
    @IBOutlet weak var partThreeButton: UIButton!
    @IBOutlet weak var partFourButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var  buttonSpecs : UIButton = UIButton();
    var score : Int = 0;
    var buttonLastHighlighted : UIButton? = nil;
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        nextButton.isHidden = true;
        backButton.isHidden = true;
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "iceAge")!);
        
    }
    
    
    @IBAction func headOnePressed(_ sender: Any) {
        score = 3;
      // partOneButton.setImage(UIImage.init(named: "animalHeadHighlighted"), for: .normal);
        buttonLastHighlighted = partOneButton;
        let secondVC = SecondIntroViewController();
          secondVC.buttonSpecs = self.buttonSpecs;
        nextButton = secondVC.formatButtons(button: nextButton);
        nextButton.isHidden = false;
        print("button 1 pressed\n");
        
        
    }
    @IBAction func headTwoPressed(_ sender: Any) {
       // partTwoButton.setImage(UIImage.init(named: "animalBodyHighlighted"), for: .normal);
        buttonLastHighlighted = partTwoButton;
        score = 16;
        let secondVC = SecondIntroViewController();
        secondVC.buttonSpecs = self.buttonSpecs;
        nextButton = secondVC.formatButtons(button: nextButton);
        nextButton.isHidden = false;
        print("button 2 pressed\n");
    }
    
    @IBAction func headThreePressed(_ sender: Any) {
        score = 5;
        nextButton.isHidden = false;
        buttonLastHighlighted = partThreeButton;
        let secondVC = SecondIntroViewController();
        secondVC.buttonSpecs = self.buttonSpecs;
        nextButton = secondVC.formatButtons(button: nextButton);
    }
    @IBAction func headFourPressed(_ sender: Any) {
        score = 54;
        nextButton.isHidden = false;
        buttonLastHighlighted = partFourButton;
        let secondVC = SecondIntroViewController();
        secondVC.buttonSpecs = self.buttonSpecs;
        nextButton = secondVC.formatButtons(button: nextButton);
        nextButton.isHidden = false;
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bodyVC = segue.destination as! PickBodiesViewController;
        bodyVC.buttonSpecs = self.buttonSpecs;
        bodyVC.totalScore = score;
        bodyVC.pickedHeadName = (buttonLastHighlighted?.accessibilityIdentifier)!;
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil);
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toPickBody", sender: self);
    }
   
  
    

}
