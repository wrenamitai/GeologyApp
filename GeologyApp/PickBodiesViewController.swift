//
//  PickBodiesViewController.swift
//  GeologyApp
//
//  Created by Wren Amitai on 7/17/19.
//  Copyright © 2019 Wren Amitai. All rights reserved.
//

import UIKit

class PickBodiesViewController: UIViewController {
    var pickedHeadName : String = "";
    var totalScore : Int = 0;
    var buttonLastHighlighted : UIButton? = nil;
    var buttonSpecs : UIButton = UIButton();
    
    @IBOutlet weak var bodyOne: UIButton!
    @IBOutlet weak var bodyTwo: UIButton!
    @IBOutlet weak var bodyThree: UIButton!
    @IBOutlet weak var bodyFour: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "iceAge")!);
        nextButton.isHidden = true;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bodyOnePressed(_ sender: Any) {
       // bodyOne.setImage(UIImage.init(named: "otherAnimalHighlighted"), for: .normal);
        buttonLastHighlighted = bodyOne;
        totalScore = totalScore + 4;
        let otherVC = SecondIntroViewController();
        otherVC.buttonSpecs = self.buttonSpecs;
        nextButton = otherVC.formatButtons(button: nextButton);
        nextButton.isHidden = false;
    }
    @IBAction func bodyTwoPressed(_ sender: Any) {
       // bodyTwo.setImage(UIImage.init(named: "vultureAnimalHighlighted"), for: .normal);
        buttonLastHighlighted = bodyTwo;
        totalScore = totalScore + 19;
        let otherVC = SecondIntroViewController();
        otherVC.buttonSpecs = self.buttonSpecs;
        nextButton = otherVC.formatButtons(button: nextButton);
        nextButton.isHidden = false;
    }
    @IBAction func bodyThreePressed(_ sender: Any) {
        buttonLastHighlighted = bodyThree;
        totalScore = totalScore + 9;
        let otherVC = SecondIntroViewController();
        otherVC.buttonSpecs = self.buttonSpecs;
        nextButton = otherVC.formatButtons(button: nextButton);
        nextButton.isHidden = false;
    }
    
    @IBAction func bodyFourPressed(_ sender: Any) {
        buttonLastHighlighted = bodyFour;
        totalScore = totalScore + 13;
        let otherVC = SecondIntroViewController();
        otherVC.buttonSpecs = self.buttonSpecs;
        nextButton = otherVC.formatButtons(button: nextButton);
        nextButton.isHidden = false;
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if (buttonLastHighlighted == nil){
            let mustPickAlert = UIAlertController(title: "Hold On!", message: "You have to pick a body first! Please choose a body then try again.", preferredStyle: .alert);
            let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil);
            mustPickAlert.addAction(okayAction);
            self.present(mustPickAlert, animated: true, completion: nil);
        }else{
            performSegue(withIdentifier: "toIceAge", sender: self);
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let animalName : String = "\(pickedHeadName)\((buttonLastHighlighted?.accessibilityIdentifier)!)";
        let iceAgeVC = segue.destination as! IceAgeViewController;
        iceAgeVC.animalID = animalName;
        iceAgeVC.finalScore = totalScore;
        iceAgeVC.buttonSpecs = self.buttonSpecs;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
