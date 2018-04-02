/*:
 
 ## This view takes you to YPad after tapping on it.
 
 ## Concept used
 * [Core Animation](glossary://CoreAnimation)
 
 ## Learn More
 * [Apple Developer Documentation](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/Introduction/Introduction.html)
 * [Wikipedia](https://en.wikipedia.org/wiki/Core_Animation)
 * [Ray Wenderlich](https://www.raywenderlich.com/tag/core-animation)
 */

//  Copyright © 2018 Yogesh Kohli. All rights reserved.


import UIKit
import PlaygroundSupport

class LiveViewiPadSelectionController : UIViewController {
    
    let label = UILabel()
    var button = UIButton()
    
    override func loadView() {
        loadViewAction()
    }
    public func goToNextPage() {
        PlaygroundPage.current.assessmentStatus = .pass(message: "\("Good job! Let's use YPad")\n\n[**Next Page**](@next)")
    }
    
    //Load view and basic UI
    public func loadViewAction() {
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        self.view = view
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.view.addSubview(self.setupLabel())
            self.animateLabel(delay: 0.4, label : self.label, animationDuration : 0.5, springVelocity : 0.3, springDamping : 2.0)
        }
    }
    //setup label heading
    func setupLabel() -> UILabel {
        label.frame = CGRect(x: 0, y: -400, width: self.view.frame.size.width, height: 300)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let fontMain = UIFont(name: "OpenSans-Bold", size:  40.0)
        let str = "Tap on YPad"
        let labelText = NSMutableAttributedString.init(string: str)
        labelText.setAttributes([NSAttributedStringKey.font: fontMain,
                                 NSAttributedStringKey.foregroundColor: UIColor.black],
                                range: NSMakeRange(0, str.count))
        label.alpha = 0
        label.attributedText = labelText
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    //Animate label
    public func animateLabel(delay: TimeInterval, label : UILabel, animationDuration : TimeInterval, springVelocity : CGFloat, springDamping : CGFloat) {
        label.alpha = 1
        UIView.animate(withDuration: animationDuration,
                       delay: delay,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: {
                        self.label.center = CGPoint(x: (self.view.frame.size.width / 2), y: self.view.frame.size.height / 2)
        },
                       completion: { (Bool) -> Void in
                        self.removeLabel(delay: 1.0, label : self.label, animationDuration : 0.5, springVelocity : 0.3, springDamping : 2.0)
        })
        
    }
    public func removeLabel(delay: TimeInterval, label : UILabel, animationDuration : TimeInterval, springVelocity : CGFloat, springDamping : CGFloat) {
        UIView.animate(withDuration: animationDuration,
                       delay: delay,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: {
                        self.label.center = CGPoint(x: (self.view.frame.size.width / 2), y: self.view.frame.size.height + 400)
        },
                       completion: { (Bool) -> Void in
                        self.label.removeFromSuperview()
                        self.showiPadOptions()
        })
    }
    
    //Displaying uiview of selection of iPad
    public func showiPadOptions() {
         button = UIButton(frame: CGRect(x: self.view.frame.size.width / 4,y: self.view.frame.size.height / 4, width: self.view.frame.size.width / 2,height: self.view.frame.size.height / 2))
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.setImage(UIImage(named: "app_icon.png"), for: .normal)
        button.addTarget(self, action: #selector(iPadButtonAction), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        
        let pulseEffect = CustomPulseAnimation(repeatCount: Float.infinity, radius:self.view.frame.size.width/3, position:button.center)
        self.view.layer.insertSublayer(pulseEffect, below: button.layer)
        button.alpha = 0
        self.view.addSubview(button)
        animateiPadOptionView(btn: button, delay: 0.3, animationDuration : 0.4, springVelocity : 0.0, springDamping : 1.0)
    }
    
    public func animateiPadOptionView(btn: UIButton, delay: TimeInterval, animationDuration : TimeInterval, springVelocity : CGFloat, springDamping : CGFloat) {
        btn.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
       
        UIView.animate(withDuration: animationDuration,
                       delay: delay,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                         btn.alpha = 1
                        btn.transform = .identity
            },
                       completion: nil)
    }
    
    //lock button action
    @objc  func iPadButtonAction(sender:UIButton!) {
        DispatchQueue.main.async {
            self.goToNextPage()
        }
    }
}

class CustomPulseAnimation: CALayer {
    
    var radius:                 CGFloat = 200.0
    var fromValueForRadius:     Float = 0.0
    var fromValueForAlpha:      Float = 0.45
    var pulseInterval:          TimeInterval = 0.0
    var keyTimeForHalfOpacity:  Float = 0.2
    var useTimingFunction:      Bool = true
    var animationGroup:         CAAnimationGroup = CAAnimationGroup()
    var repetitions:            Float = Float.infinity
    var animationDuration:      TimeInterval = 3.0
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    init(repeatCount: Float=Float.infinity, radius: CGFloat, position: CGPoint) {
        super.init()
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0.0
        self.backgroundColor = UIColor.blue.cgColor
        self.radius = radius;
        self.repetitions = repeatCount;
        self.position = position
        
        DispatchQueue.global(qos: .background).async {
            self.setupAnimationGroup()
            self.setPulseRadius(radius: self.radius)
            
            if (self.pulseInterval != Double.infinity) {
                DispatchQueue.main.async {
                    self.add(self.animationGroup, forKey: "pulse")
                }
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPulseRadius(radius: CGFloat) {
        self.radius = radius
        let tempPos = self.position
        let diameter = self.radius * 2
        self.bounds = CGRect(x: 0.0, y: 0.0, width: diameter, height: diameter)
        self.cornerRadius = self.radius
        self.position = tempPos
    }
    
    func setupAnimationGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = self.animationDuration + self.pulseInterval
        self.animationGroup.repeatCount = self.repetitions
        self.animationGroup.isRemovedOnCompletion = false
        
        if self.useTimingFunction {
            let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            self.animationGroup.timingFunction = defaultCurve
        }
        
        self.animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
    }
    
    func createScaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: self.fromValueForRadius)
        scaleAnimation.toValue = NSNumber(value: 1.0)
        scaleAnimation.duration = self.animationDuration
        
        return scaleAnimation
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = self.animationDuration
        opacityAnimation.values = [self.fromValueForAlpha, 0.8, 0]
        opacityAnimation.keyTimes = [0, self.keyTimeForHalfOpacity as NSNumber, 1]
        opacityAnimation.isRemovedOnCompletion = false
        
        return opacityAnimation
    }
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = LiveViewiPadSelectionController()

PlaygroundPage.current.needsIndefiniteExecution = true

