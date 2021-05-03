//
//  ViewController.swift
//  GeologyApp
//
//  Created by Wren Amitai on 7/10/19.
//  Copyright © 2019 Wren Amitai. All rights reserved.
//

import UIKit
import CMPopTipView
import ButtonAppearance

class ViewController: UIViewController {
    func intro (){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "museumInvite")!);
        skipButton.isHidden = true;
        titleButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Light", size: 23);
        titleButton.backgroundColor = chatBubble.backgroundColor;
        
        titleButton.setCornerRadius(Float(chatBubble.cornerRadius), borderWidth: Float(chatBubble.borderWidth), borderColor: chatBubble.borderColor);
        titleButton.titleLabel?.font
        
        
    }
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    
    let introText : [String] = ["Today, you'll be building your own animal!", "Your job is to make an animal that would do well in two different environments: the Ice Age and today!", "But first, let's learn a little bit about the Ice Age...", "Much better!", "Globally, temperatures during the Ice Age were about 12ºF colder than today. In some places, temperatures were up to 40ºF colder!", "Let's learn more about how you'll be building!"]; //ice grew 12k thick
    
    @IBOutlet weak var manny: UIButton!
    var chatBubble = CMPopTipView();
    
  
    
    
    var count = -1;
    var tapCount : Int = 0;
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fakeMuseumBR")!);
        chatBubble.isUserInteractionEnabled = false;
        chatBubble.message = "Hi! My name is Manny, and I'll be the one guiding you through this activity!";
        chatBubble.has3DStyle = false;
        chatBubble.textFont = UIFont.init(name: "ChalkboardSE-Light", size: 17);
       chatBubble.disableTapToDismiss = false;
        chatBubble.hasGradientBackground = false;
        playButton.titleLabel?.font = chatBubble.textFont;
        playButton.backgroundColor = chatBubble.backgroundColor;
        
        playButton.setCornerRadius(Float(chatBubble.cornerRadius), borderWidth: Float(chatBubble.borderWidth), borderColor: chatBubble.borderColor);
        skipButton.isHidden = true;
        manny.isHidden = true;
        intro();
     
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        playButton.isHidden = true;
        titleButton.isHidden = true;
        manny.isHidden = false;
        skipButton.titleLabel?.font = chatBubble.textFont;
        skipButton.backgroundColor = chatBubble.backgroundColor;
        skipButton.setCornerRadius(Float(chatBubble.cornerRadius), borderWidth: Float(chatBubble.borderWidth), borderColor: chatBubble.borderColor);
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "museumBR")!);
        skipButton.isHidden = false;
        chatBubble.presentPointing(at: manny, in: self.view, animated: true);
    }
    @IBAction func tapScreen(_ sender: Any) {
        if (!skipButton.isHidden){
        if(tapCount == 3){
            
            UIView.animate(withDuration: 1.0, delay: 0, options:[.curveEaseIn, .transitionCrossDissolve] , animations: {
                self.view.backgroundColor = UIColor.black;
                self.view.backgroundColor = UIColor(patternImage: UIImage(named: "iceAge")!);
                self.chatBubble.isHidden = true;
                
            })
           
        }
        if (tapCount < 6){
            chatBubble.message = introText[tapCount];
            if (tapCount == 3){
                delayWithSeconds(1){
                    self.chatBubble.isHidden = false; self.chatBubble.presentPointing(at: self.manny, in: self.view, animated: true);
                }
            }else{
                 chatBubble.presentPointing(at: manny, in: self.view, animated: true);
            }
           
            tapCount+=1;
            print("index \(tapCount)");
        }else{
            performSegue(withIdentifier: "nextIntro", sender: self);
            }
        }
        
    }
    

   /* func newLabelAppears(){
        var insideIndex : String.Index;
        var insideCount = 0;
        
        while (insideCount < x.count){
            insideIndex = x.index(x.startIndex, offsetBy: insideCount)
            introLabel.text = "";
            Timer.scheduledTimer(withTimeInterval:0.5, repeats: true){
                (timer) in
                self.introLabel.text?.append(self.x[i]);
            }
    }
 
    }*/

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "nextIntro"){
            let destVC = segue.destination as! SecondIntroViewController;
            destVC.buttonSpecs = skipButton;
        }else{
           let destVC = segue.destination as! PickHeadsController;
            destVC.buttonSpecs = skipButton;
        }
        
    }
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        self.viewDidLoad();
    }

  
    

}

