//
//  IceAgeViewController.swift
//  GeologyApp
//
//  Created by Wren Amitai on 7/17/19.
//  Copyright © 2019 Wren Amitai. All rights reserved.
//

import UIKit
import ProgressMeter
import CMPopTipView

class IceAgeViewController: UIViewController {
    var animalID : String = "";
    var finalScore : Int = 0;
    var tapCount : Int = 0;
    var buttonSpecs : UIButton = UIButton();
    
    @IBOutlet weak var scoreBar: ProgressMeter!
    @IBOutlet weak var manny: UIButton!
    @IBOutlet weak var timePeriod: UILabel!
    @IBOutlet weak var finalAnimal: UIImageView!

    @IBOutlet weak var scoresAgain: UIButton!
    
    @IBOutlet weak var exit: UIButton!
    @IBOutlet weak var startOver: UIButton!
    
    var animalDesc = CMPopTipView();
    let headText : [String] = ["You're touching the head now!", "Your animal's long tusks are great for getting food through the snow and ice!", "Your animal's trunk helps it cool off in hot habitats today!", "And so on", "Until I'm done!"];
    var headTouch = false;
    let bodyText : [String] = ["You're touching the body!", "Body trait #1", "#2", "And so on", "Until you've described all the traits!"];
    var bodyTouch = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapCount = 0;
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "iceAge")!);
        // Do any additional setup after loading the view.
        finalAnimal.image = UIImage(named: "Animal 1");
        scoreBar.progress = Float(finalScore)/100;
        finalAnimal.accessibilityIdentifier = "Animal 1";
        print(Float(finalScore)/100);
        animalDesc.isUserInteractionEnabled = false;
        animalDesc.message = "Hi there! Manny again, here to show you how your animal is doing in the Ice Age! Tap your animal to learn more.";
        animalDesc.has3DStyle = false;
        animalDesc.textFont = UIFont.init(name: "ChalkboardSE-Light", size: 17);
        animalDesc.disableTapToDismiss = false;
        animalDesc.hasGradientBackground = false;
        animalDesc.presentPointing(at: manny, in: self.view, animated: true);
        animalDesc.isHidden = false;
        scoresAgain.isHidden = true;
        exit.isHidden = true;
        startOver.isHidden = true;
        let formatVC = SecondIntroViewController();
        formatVC.buttonSpecs = self.buttonSpecs;
        //formatVC.formatButtons(button: startOver);
        formatVC.formatButtons(button: exit);
       // formatVC.formatButtons(button: scoresAgain);
        scoreBar.isHidden = true;
        startOver.isHidden = true;
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            print(position)
            if (position.y > 700 && !bodyTouch && !headTouch){
                bodyTouch = true;
            }else if (position.y <= 700 && !bodyTouch && !headTouch){
                headTouch = true;
            }
        }
    }
    @IBAction func tapGesture(_ sender: Any) {
       /* tapCount+=1;
        print("here w tapcount: \(tapCount)");
        if (tapCount < 9){
            if (tapCount == 5){
                updateUIForToday();
            }
            animalDesc.message = resultsText[tapCount];
            animalDesc.presentPointing(at: manny, in: self.view, animated: true);
        }else{
            //present buttons w options
            animalDesc.isHidden = true;
            scoresAgain.isHidden = false;
            exit.isHidden = false;
            startOver.isHidden = false;
        }*/
        if (bodyTouch){
            if (tapCount >= bodyText.count){
                tapCount = 0;
                bodyTouch = false;
                animalDesc.message = "That's all for this part of your animal! Keep tapping to learn more or make a new animal!";
                exit.isHidden = false;
                startOver.isHidden = false;
            }else{
                if (tapCount == 2){
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "today")!);
                }
                animalDesc.message = bodyText[tapCount];
                tapCount+=1;
            }
        }else{
            if (tapCount >= headText.count){
                tapCount = 0;
                headTouch = false;
                animalDesc.message = "That's all for this part of your animal! Keep tapping to learn more or make a new animal!";
                exit.isHidden = false;
                startOver.isHidden = false;
            }else{
                if (tapCount == 2){
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "today")!);
                    timePeriod.text = "Today";
                }

                animalDesc.message = headText[tapCount];
               // animalDesc.presentPointing(at: manny, in: self.view, animated: true);
                tapCount+=1;
            }
        }
        animalDesc.presentPointing(at: manny, in: self.view, animated: true);
        
        
    }
    
    func updateUIForToday(){
        timePeriod.text = "21st Century";
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "today")!);
        scoreBar.progressTintColor = .green;
        animalDesc.message = "";
        scoreBar.progress = 0.9;
    }
    
    
    @IBAction func scoresAgainPressed(_ sender: Any) {
        viewDidLoad();
        
    }

  //  override func prepareForUnwindWithSegue(){
        
   // }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toEnd"){
            let destVC = segue.destination as! EndViewController;
            //destVC.animalImage = finalAnimal;
            //destVC.animalImage.accessibilityIdentifier = animalID;
           // destVC.why = 75;
            //destVC.animalImage.image = finalAnimal.image;
            destVC.image = finalAnimal.image!;
           // print(destVC.animalImage.accessibilityIdentifier!);
        }
    }
 

    @IBAction func startOverPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToViewController", sender: self);
    }
}
