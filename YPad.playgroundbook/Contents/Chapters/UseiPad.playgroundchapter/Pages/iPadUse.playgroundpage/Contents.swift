/*:
 
 ## Tips to use
 * Home button icon -> To get out of the app i.e to close the running app.
 * Lock Screen icon -> To lock the iPad.
 * Please click on every icon at least once to see what happens
 
 ## Concept used
 * [Core Animation](glossary://CoreAnimation)
 * [CAEmitterLayer of Core Animation framework](glossary://Emitter)
 * [Gestures](glossary://Gestures)
 * UIKit - UICollectionView, UIPickerView and many more.
 * Audio
 * Timer
 

 ## Basic detail about every app here
 
 ### Confetti, Firework & Bubble Animation
 * It uses CAEmitterLayer class of Core Animation framework.
 * I Made use of EmitterCell and assigned proper constraints to it like direction, birth rate and many more.
 
 ### Fish Animation
 * It shows how the fish releases bubbles while moving.
 
 ### Interest
 * It describes my interest - Gaming, Cars, iPhone, Apple Watch and used animation to move along the specific path.
 
 ### Paint
 * It Uses UIView to make drawing view.
 * UIPickerView to pick the color
 * Slider to change the thickness of pen
 
 ### My Info App - Few Details about me
 * I tried to show basic info about me in an interactive way.
 
 ### Diet Predictor - Meal Suggestions
 * This app predicts your next meal according to the calories that you have consumed in your previous meal.
 
 ## Learn more
 * [Apple Developer Documentation](https://developer.apple.com/documentation/)
 */

//  Copyright © 2018 Yogesh Kohli. All rights reserved.

import UIKit
import PlaygroundSupport
import AVFoundation

class LiveViewiPadViewController : UIViewController, UIGestureRecognizerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Variables
    fileprivate  var myCollectionView : UICollectionView? = nil
    fileprivate  var appleLogo = UIImageView()
    fileprivate  var resumeImageView = UIImageView()
    fileprivate  let progressView = UIProgressView(progressViewStyle: .bar)
    fileprivate  let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    fileprivate  var progressValue : Double = 0.0
    fileprivate  var label = UILabel()
    fileprivate  var timer: Timer? = Timer()
    fileprivate  var counter = 0
    fileprivate  var subview = UIView()
    fileprivate  var swipeLabel = UILabel()
    fileprivate  var dogLabel = UILabel()
    fileprivate  var xAxisLabel = UILabel()
    fileprivate  var yAxisLabel = UILabel()
    fileprivate  var swipeRight = UISwipeGestureRecognizer()
    fileprivate  let sectionInsets = UIEdgeInsets(top: 30.0, left: 10.0, bottom: 30.0, right: 10.0)
    fileprivate  var particleEmitter: CAEmitterLayer? = nil
    fileprivate  var generalView = UIView()
    fileprivate  var bubbleSortView = UIView()
    fileprivate  var emitter = CAEmitterLayer()
    fileprivate  var interestEmitterLayer: CAEmitterLayer? = nil
    fileprivate  var drawView = DrawView()
    fileprivate  var drawEditView = UIView()
    fileprivate  var buttonEraser = UIButton()
    fileprivate  var buttonClearScreen = UIButton()
    fileprivate  var isEraserSelected = Bool()
    fileprivate  var lastColorSelected = UIColor()
    fileprivate  var slider = UISlider()
    fileprivate  var colorPicker = UIPickerView()
    fileprivate  var player: AVAudioPlayer?
    fileprivate  var pulseEffect : CustomPulseAnimation? = nil
    fileprivate  var resumeTimer = Timer()
    fileprivate  var mealView = UIView()
    fileprivate  var resumeStartButton = UIButton()
    fileprivate  var buttonCalorieClick = UIButton()
    fileprivate  var buttonCake = UIButton()
    fileprivate  var buttonEducation = UIButton()
    fileprivate  var buttonMasters = UIButton()
    fileprivate  var buttonApps = UIButton()
    fileprivate  var buttonDietPredictor = UIButton()
    fileprivate  var buttonMealType1 = UIButton()
    fileprivate  var buttonMealType2 = UIButton()
    fileprivate  var buttonMealType3 = UIButton()
    fileprivate  var buttonMealType4 = UIButton()
    fileprivate  var buttonMealType5 = UIButton()
    fileprivate  var isMealType1opened = Bool()
    fileprivate  var isMealType2opened = Bool()
    fileprivate  var isMealType3opened = Bool()
    fileprivate  var isMealType4opened = Bool()
    fileprivate  var isMealType5opened = Bool()
    fileprivate  var buttonMealSuggestion1 = UIButton()
    fileprivate  var buttonMealSuggestion2 = UIButton()
    fileprivate  var buttonMealSuggestion3 = UIButton()
    fileprivate  var buttonMealSuggestion4 = UIButton()
    fileprivate  var labelSuggestionHeading1 = UILabel()
    fileprivate  var labelSuggestionSubHeading = UILabel()
    fileprivate  var labelSuggestionHeading2 = UILabel()
    fileprivate  var finalMealView = UIView()
    fileprivate  var labelTotalCalories = UILabel()
    fileprivate  var labelCaloriesRemaining = UILabel()
    fileprivate  var isFishStopped = Bool()
    fileprivate  var isCakeOpen = Bool()
    fileprivate  var isEducationOpen = Bool()
    fileprivate  var isMastersOpen = Bool()
    fileprivate  var isAppsOpen = Bool()
    fileprivate  var currentCountDanceImage = 0
    fileprivate  var fishTimer: Timer? = Timer()
    fileprivate  var danceTimer: Timer? = Timer()
    fileprivate  var fishImageView: UIImageView?
    fileprivate  var genderAgeSelectionView = UIView()
    fileprivate  var activityDailyView = UIView()
    fileprivate  var caloryTitleView = UIView()
    fileprivate  var foodMakingView = UIView()
    fileprivate  var buttonGenderMale = UIButton()
    fileprivate  var buttonGenderFemale = UIButton()
    fileprivate  var buttonAgeBelow20 = UIButton()
    fileprivate  var buttonAge2130 = UIButton()
    fileprivate  var buttonAge3140 = UIButton()
    fileprivate  var isMaleSelected = Bool()
    fileprivate  var isFemaleSelected = Bool()
    fileprivate  var isBelow20Selected = Bool()
    fileprivate  var is2130Selected = Bool()
    fileprivate  var is3140Selected = Bool()
    fileprivate  var isAbove40Selected = Bool()
    fileprivate  var buttonSeeCalorie = UIButton()
    fileprivate  var buttonAge40Above = UIButton()
    fileprivate  var labelAgeSelector = UILabel()
    fileprivate  var calorieShowView = UIView()
    fileprivate  var resumeBackgroundCover = UIImageView()
    fileprivate  var dancingImageView = UIImageView()
    fileprivate  var currentCountResumeImage : Int = 0
    fileprivate  var maleCalorieArray : NSArray = [3200, 3000, 2800, 2700]
    fileprivate  var femaleCalorieArray : NSArray = [2500, 2400, 2200, 2100]
    fileprivate  let colorDisplayArray : NSArray = ["black", "red", "green", "yellow", "blue", "gray", "orange"]
    fileprivate  let colorArray: NSArray = [UIColor.black, UIColor.red, UIColor.green, UIColor.yellow, UIColor.blue, UIColor.gray, UIColor.orange]
    fileprivate  let appTitleArray : NSArray = ["YConfetti", "YPaint", "YFish", "YDiet", "YInfo", "YBubble", "YInterest","YFirework"]
    fileprivate  let appImageArray : NSArray = ["app_icon_confetti.png", "app_icon_paint.png", "app_icon_fish.png","app_icon_diet.png","app_icon_yogesh.png", "app_icon_bubble.png","app_icon_hobbies.png", "app_icon_firework.png"]
    
    
    
    //Confetti, Paint, Fish, Diet, Yogesh, Bubble, Interest, Firework
    
    //to load the view
    override func loadView() {
        loadViewAction()
    }
    
    //Setting custom collection view - DataSource & Delegates
    public func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionViewFrame = CGRect(x: 0,y: 80, width: self.view.frame.size.width, height : self.view.frame.size.height - 160)
        layout.scrollDirection = .horizontal
        myCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.backgroundColor = UIColor.clear
        myCollectionView?.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.view.addSubview(myCollectionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (4 + 1)
        let availableWidth = self.view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 4
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appImageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.label.text =  appTitleArray.object(at: indexPath.row) as! String
        cell.layer.cornerRadius = 15.0
        cell.imageView.image = UIImage(named: appImageArray.object(at: indexPath.row) as! String)
        cell.layer.masksToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
       
        self.resumeStartButton.removeFromSuperview()
        clearFishScene()
        
        //CONFETTI ANIMATION
        if indexPath.row == 0 {
            DispatchQueue.main.async {
                self.makeConfettiAnimation()
                self.particleEmitter = nil
            }
        }
            //PAINT ANIMATION
        else if indexPath.row == 1 {
            addDrawView().popInView()
        }
            //FISH ANIMATION
        else if indexPath.row == 2 {
            DispatchQueue.main.async{
                self.clearFishScene()
                self.setupFishScene()
            }
        }
            //DIET ANIMATION
        else if indexPath.row == 3 {
            self.setupGenderAgeSceneView()
        }
            //YOGESH RESUME
        else if indexPath.row == 4 {
            DispatchQueue.main.async {
                self.addResumeView()
            }
        }
            // BUBBLE ANIMATION
        else if indexPath.row == 5 {
            DispatchQueue.main.async {
                self.makeBubbleAnimation()
                self.particleEmitter = nil
            }
        }
            //INTEREST ANIMATION
        else if indexPath.row == 6 {
            DispatchQueue.main.async {
                self.makeInterestAnimation()
            }
        }
            //FIREWORK ANIMATION
        else if indexPath.row == 7 {
            DispatchQueue.main.async {
                self.makeFireworkAnimation()
                self.particleEmitter = nil
            }
        }
    }
    
    //Setting up pickerview - drawing view -> color picking mechanism (DataSource & Delegates)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorDisplayArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorDisplayArray[row] as? String
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if pickerView.selectedRow(inComponent: component) == row {
            pickerLabel.textColor = UIColor.red
            pickerLabel.text = colorDisplayArray[row] as! String
            let fontMain = UIFont(name: "HelveticaNeue", size:  22.0)
            pickerLabel.font = fontMain
            
        } else {
            pickerLabel.textColor = UIColor.black
            pickerLabel.text = colorDisplayArray[row] as! String
            let fontMain = UIFont(name: "HelveticaNeue", size:  16.0)
            pickerLabel.font = fontMain
        }
        
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row < colorArray.count {
            self.drawView.drawColor = colorArray[row] as! UIColor
            lastColorSelected = colorArray[row] as! UIColor
        }
        DispatchQueue.main.async {
            self.colorPicker.reloadAllComponents()
            self.isEraserSelected = false
            self.buttonEraser.backgroundColor = UIColor.white
            self.buttonEraser.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    //Load view and basic UI
    public func loadViewAction() {
        let view = UIView()
        view.backgroundColor = UIColor.black
        self.view = view
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.addAppleLogo()
        }
    }
    
    //Adding apple logo at the start
    public func addAppleLogo() {
        appleLogo = UIImageView(image: UIImage(named: "apple.png"))
        appleLogo.frame = CGRect(x: self.view.frame.size.width / 3,y: self.view.frame.size.height / 2 - 200,width: self.view.frame.size.width / 3,height: 200)
        appleLogo.contentMode = .scaleAspectFit
        appleLogo.alpha = 0
        self.view.addSubview(appleLogo)
        animateAppleLogo(logo : appleLogo, delay: 0.0, animationDuration : 0.2, springVelocity : 0.0, springDamping : 0.8)
    }
    
    //Adding progress bar at the start with apple logo
    public func addProgressView() {
        progressView.center = view.center
        progressView.setProgress(0.0, animated: true)
        progressView.trackTintColor = UIColor.gray
        progressView.tintColor = UIColor.white
        self.view.addSubview(progressView)
        updateProgress(progressView : progressView)
    }
    
    //Progress bar update action
    @objc public func updateProgress(progressView : UIProgressView) {
        progressValue = progressValue + 0.03
        self.progressView.progress = Float(progressValue)
        let tempPorgressValue = Int(progressValue)
        if tempPorgressValue != 1 {
            self.perform(#selector(updateProgress), with: nil, afterDelay: 0.1)
        }
        else{
            //Hide progress view and show activity indicator and label - setting up your personal iPad
            self.progressView.removeFromSuperview()
            self.appleLogo.removeFromSuperview()
            self.addActivityIndicator()
            self.view.addSubview(setupLabel())
            self.animateLabel(delay : 0.4, label : setupLabel())
        }
    }
    //Adding activity indicator after starting up
    public func addActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        timer = Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(updateLabelHeading), userInfo: nil, repeats: true)
    }
    
    //setup label heading with activity indicator
    func setupLabel() -> UILabel {
        label.frame = CGRect(x: 0, y: (self.view.frame.size.height/2) - 150 , width: self.view.frame.size.width, height: 60)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.text = "Starting up"
        label.textAlignment = .center
        let cfURL = Bundle.main.url(forResource: "OpenSans-Regular", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let fontMain = UIFont(name: "HelveticaNeue", size:  30.0)
        label.font = fontMain
        label.alpha = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    //Update Label heading after certain amount of time
  @objc func updateLabelHeading() {
        counter += 1
        if counter <= 12 {
            if counter == 9 {
                DispatchQueue.main.async {
                    self.animateLabel(delay : 0.3, label : self.setupLabel())
                    self.label.text = "Finished"
                }
            }
        }
        else{
            timer?.invalidate()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.25, execute: {
                self.activityIndicator.removeFromSuperview()
                self.label.removeFromSuperview()
                //show him the lock screen
                self.addLockScreenView()
            })
        }
    }
    
    
    //Lock Screen Code - Show lock screen after starting up process completed
    public func showLockScreenWithAnimation(delay: TimeInterval, animationDuration : TimeInterval, springDamping : CGFloat, springVelocity : CGFloat) {
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            self.view.alpha = 1
        }) { (Bool) -> Void in
            UIView.animate(withDuration: animationDuration, delay: delay, options: [.curveEaseOut], animations: { () -> Void in
                self.view.alpha = 1
                self.view.backgroundColor = UIColor(patternImage: UIImage(named: "lockscreen.jpg")!)
            }, completion: { (Bool) -> Void in
                //add time and show it in image lockscreen here and add swipe gesture too
                self.displayDateTimeLabel()
                self.animateTimeLabel(delay: 0.2, label : self.label, animationDuration : 0.5)
                self.setupSwipeGestureLabel()
                self.animateSwipeLabel(delay: 0.0, label : self.swipeLabel)
                self.loadSwipeGesture()
                self.timer = Timer.scheduledTimer(timeInterval:50, target: self, selector: #selector(self.updateTimeTimerAction), userInfo: nil, repeats: true)
            })
        }
    }
    
    //Display of date time label on lock screen
    public func displayDateTimeLabel() {
        label.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 200)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.textAlignment = .center
        let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let fontMain = UIFont(name: "HelveticaNeue", size:  120.0)
        let fontSecondary = UIFont(name: "OpenSans-Bold", size:  30.0)
        let timeString = makeTimeString()
        let dayYearString = makeDayYearString()
        let labelText = NSMutableAttributedString.init(string: timeString + "\n" + dayYearString)
        labelText.setAttributes([NSAttributedStringKey.font: fontMain,
                                 NSAttributedStringKey.foregroundColor: UIColor.white],
                                range: NSMakeRange(0, timeString.count))
        labelText.setAttributes([NSAttributedStringKey.font: fontSecondary,
                                 NSAttributedStringKey.foregroundColor: UIColor.white],
                                range: NSMakeRange(timeString.count,dayYearString.count + 1))
        label.attributedText = labelText
        label.alpha = 0
        label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label)
        
    }
    
    //Formation of time string to show on lock screen
    public func makeTimeString() -> String{
        let date = Date()
        let calendar = Calendar.current
        var hour = String(calendar.component(.hour, from: date))
        var minutes = String(calendar.component(.minute, from: date))
        
        if (calendar.component(.hour, from: date)) < 10 {
            hour = "0" + hour
        }
        
        if (calendar.component(.minute, from: date)) < 10 {
            minutes = "0" + minutes
        }
        return (hour + ":" + minutes)
    }
    
    //Formation of day year to show on lock screen
    public func makeDayYearString() -> String{
        let date = Date()
        let monthName = getMonthName()
        let formatter  = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let dateString = formatter.string(from: date)
        let dayOfWeek = getDayOfWeek(dateString)
        let calendar = Calendar.current
        let day = String(calendar.component(.day, from: date))
        return (dayOfWeek + ", " + monthName + " " + day)
    }
    
    //Getting current month
    func getMonthName() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let strMonth = dateFormatter.string(from: date)
        return strMonth
    }
    
    //Getting current day
    func getDayOfWeek(_ today:String) -> String {
        let weekdays = [1:"Sunday", 2:"Monday", 3:"Tuesday", 4:"Wednesday", 5:"Thursday", 6:"Friday", 7:"Saturday"]
        let formatter  = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        if let todayDate = formatter.date(from: today) {
            let myCalendar = Calendar(identifier: .gregorian)
            let weekDay = myCalendar.component(.weekday, from: todayDate)
            let day = weekdays[weekDay]
            
            return day!
        } else {
            return ""
        }
    }
    
    //setup swipe to unlock label on lock screen
    func setupSwipeGestureLabel() -> UILabel {
        swipeLabel.frame = CGRect(x: 0, y: self.view.frame.size.height - 100, width: self.view.frame.size.width, height: 60)
        swipeLabel.lineBreakMode = .byWordWrapping
        swipeLabel.numberOfLines = 0
        swipeLabel.textColor = UIColor.black
        swipeLabel.textAlignment = .center
        let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let fontMain = UIFont(name: "HelveticaNeue", size:  30.0)
        swipeLabel.text = "Swipe right to unlock"
        swipeLabel.font = fontMain
        swipeLabel.adjustsFontSizeToFitWidth = true
        swipeLabel.sizeToFit()
        swipeLabel.layer.shadowColor = UIColor.black.cgColor
        swipeLabel.layer.shadowRadius = 3.0
        swipeLabel.layer.shadowOpacity = 1.0
        swipeLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        swipeLabel.layer.masksToBounds = false
        self.view.addSubview(swipeLabel)
        return swipeLabel
    }
    
    //Load swipe right gesture on lock screen
    public func loadSwipeGesture() {
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(slideToRightWithGestureRecognizer))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    //show home and lock screen button at the right corner of main page and animate them
    public func showButtonOptions() {
        // Create the subview
        subview = UIView(frame: CGRect(x: ( self.view.frame.size.width * 1 ) / 1.5,y: self.view.frame.size.height - 80, width: self.view.frame.size.width / 4,height: 80))
        
        // Add button home
        let button1 = UIButton(frame: CGRect(x: 0,y: 10,width: 60,height: 60))
        button1.layer.masksToBounds = true
        button1.clipsToBounds = true
        button1.setImage(UIImage(named: "home.png"), for: .normal)
        button1.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        
        // Add button lock
        let button2 = UIButton(frame: CGRect(x: 80,y: 10,width: 60,height: 60))
        button2.layer.masksToBounds = true
        button2.clipsToBounds = true
        button2.setImage(UIImage(named: "lock.png"), for: .normal)
        button2.addTarget(self, action: #selector(lockButtonAction), for: .touchUpInside)
        
        subview.addSubview(button1)
        subview.addSubview(button2)
        
        subview.alpha = 0
        self.view.addSubview(subview)
        animateButtonOptionView(view: subview, delay: 0.3, animationDuration : 0.4, springVelocity : 0.0, springDamping : 1.0)
    }
    
    //Remove collection view from the superview
    public func removeCollectionView(){
        self.myCollectionView?.removeFromSuperview()
    }
    
    //present lock screen view - calling animation function of lock screen here
    public func addLockScreenView() {
        self.showLockScreenWithAnimation(delay: 0.3, animationDuration : 1.0, springDamping : 0.2, springVelocity : 0.0)
    }
    
    //Remove lock screen view and present collection view
    public func removeLockScreenView() {
        if let recognizer = self.swipeRight as? UISwipeGestureRecognizer {
            self.view.removeGestureRecognizer(recognizer)
        }
        self.swipeLabel.removeFromSuperview()
        self.label.removeFromSuperview()
        self.setupCollectionView()
        self.showButtonOptions()
    }
    
    //Remove home and lock screen buttons on locking of screen
    public func removeButtonsOptionsView() {
        subview.removeFromSuperview()
    }
    
    //Adding drawing view and adding required components with it like editor and all buttons.
    public func addDrawView() -> UIView{
        //General view is the superview here
        generalView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height : self.view.frame.size.height - 160)
        generalView.backgroundColor = UIColor.white
        
        label.removeFromSuperview()
        
        //Draw view
        drawView.frame = CGRect(x: 125, y: 0, width: self.generalView.frame.size.width - self.generalView.frame.size.width / 6, height : self.generalView.frame.size.height)
        drawView.backgroundColor = UIColor.white
        
        //Label
        label.frame = CGRect(x: 0, y: 10 , width: self.drawView.frame.size.width, height: 35)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.text = "My Paint"
        label.textAlignment = .center
        let cfURL = Bundle.main.url(forResource: "OpenSans-Regular", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let fontMain = UIFont(name: "HelveticaNeue", size:  25.0)
        label.font = fontMain
        label.alpha = 1.0
        label.adjustsFontSizeToFitWidth = true
        
        //Edit view - feature console
        drawEditView.frame = CGRect(x: 0,y: 0, width: 125, height : self.generalView.frame.size.height)
        drawEditView.layer.borderColor = UIColor.gray.cgColor
        drawEditView.layer.borderWidth = 1.0
        lastColorSelected = UIColor.black
        buttonEraser.removeFromSuperview()
        slider.removeFromSuperview()
        colorPicker.removeFromSuperview()
        slider = UISlider(frame:CGRect(x: 20, y: 20, width: drawEditView.frame.size.width - 40, height: 20))
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.isContinuous = true
        slider.tintColor = UIColor.red
        slider.value = 0.1
        slider.addTarget(self, action: #selector(sliderValueDidChange(sender :)), for: .valueChanged)
        
        // Add button eraser
        buttonEraser = UIButton(frame: CGRect(x: 20,y: 70,width: drawEditView.frame.size.width - 40,height: 40))
        buttonEraser.backgroundColor = UIColor.white
        buttonEraser.titleLabel?.textAlignment = .center
        buttonEraser.layer.cornerRadius = 5
        buttonEraser.layer.borderColor = UIColor.gray.cgColor
        buttonEraser.layer.borderWidth = 2.0
        buttonEraser.layer.masksToBounds = true
        buttonEraser.setTitleColor(UIColor.black, for: .normal)
        buttonEraser.clipsToBounds = true
        buttonEraser.setTitle("Eraser", for: .normal)
        buttonEraser.addTarget(self, action: #selector(buttonEraserAction), for: .touchUpInside)
        
        //Adding color picker
        colorPicker.frame = CGRect(x: 20,y: 130, width: drawEditView.frame.size.width - 40, height: 100)
        colorPicker.delegate = self
        colorPicker.dataSource = self
        colorPicker.layer.cornerRadius = 5
        colorPicker.layer.borderColor = UIColor.gray.cgColor
        colorPicker.layer.borderWidth = 2.0
        
        // Add button clear screen
        buttonClearScreen = UIButton(frame: CGRect(x: 20,y: drawEditView.frame.size.height - 80,width: drawEditView.frame.size.width - 40,height: 40))
        buttonClearScreen.backgroundColor = UIColor.white
        buttonClearScreen.titleLabel?.textAlignment = .center
        buttonClearScreen.layer.cornerRadius = 5
        buttonClearScreen.layer.borderColor = UIColor.gray.cgColor
        buttonClearScreen.layer.borderWidth = 2.0
        buttonClearScreen.layer.masksToBounds = true
        buttonClearScreen.setTitleColor(UIColor.black, for: .normal)
        buttonClearScreen.clipsToBounds = true
        buttonClearScreen.setTitle("Clear", for: .normal)
        buttonClearScreen.addTarget(self, action: #selector(buttonClearScreenAction), for: .touchUpInside)
        
        //Adding all to their corresponding superviews
        self.drawEditView.addSubview(colorPicker)
        self.drawEditView.addSubview(slider)
        self.drawEditView.addSubview(buttonClearScreen)
        self.drawEditView.addSubview(buttonEraser)
        self.generalView.addSubview(drawEditView)
        self.generalView.addSubview(drawView)
        self.drawView.addSubview(label)
        self.view.addSubview(generalView)
        
        return generalView
    }
    
    //Remove general view and remove all it's child views as well.
    public func removeGeneralView(){
        if player != nil {
            player?.stop()
        }
      //  DispatchQueue.main.async {
            self.generalView.removeFromSuperview()
            self.resumeImageView.removeFromSuperview()
            self.resumeStartButton.removeFromSuperview()
            self.buttonCake.removeFromSuperview()
            self.buttonEducation.removeFromSuperview()
            self.buttonMasters.removeFromSuperview()
            self.buttonApps.removeFromSuperview()
            self.drawView.removeFromSuperview()
            self.drawEditView.removeFromSuperview()
            self.label.removeFromSuperview()
            self.resumeBackgroundCover.removeFromSuperview()
       // }
    }
    
    //Removing drawing view separately
    public func removeDrawView(){
        drawView.removeFromSuperview()
    }
    
    //Adding view for resume - basi details about me application
    public func addResumeView() {
        generalView.removeFromSuperview()
        generalView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height : self.view.frame.size.height - 160)
        generalView.backgroundColor = UIColor.clear
        resumeImageView.frame = CGRect(x: 0, y: 0, width: self.generalView.frame.size.width, height : self.generalView.frame.size.height)
        resumeImageView.contentMode = .scaleAspectFit
        self.generalView.addSubview(resumeImageView)
        self.view.addSubview(generalView)
        playResumeBackgroundSound()
        addResumeTimer()
        currentCountResumeImage = 0
    }
    
    //Playing sound with yogesh reusme / details app
    func playResumeBackgroundSound() {
        let musicPath = Bundle.main.path(forResource:"resume_audio", ofType: "mp3")
        let url = NSURL(fileURLWithPath: musicPath!)
        do{
            player = try AVAudioPlayer(contentsOf: url as URL)
        }catch _ {
            player = nil
        }
        player?.numberOfLoops = -1
        player?.prepareToPlay()
        player?.play()
    }
    
    //Adding timer to resume / details app
    func addResumeTimer() {
        resumeTimer = Timer.scheduledTimer(timeInterval:1/7, target: self, selector: #selector(updateResumeFrames), userInfo: nil, repeats: true)
    }
    
    //setup get started button
    func setupStartResumeButton(){
        resumeStartButton.frame = CGRect(x: self.resumeImageView.frame.size.width / 3, y: self.resumeImageView.frame.size.height - 100, width: self.resumeImageView.frame.size.width / 3
            , height: 60)
        resumeStartButton.setTitle("Say Hi!", for: .normal)
        resumeStartButton.layer.cornerRadius = 10.0
        resumeStartButton.layer.masksToBounds = true
        resumeStartButton.backgroundColor = UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1)
        resumeStartButton.titleLabel?.textAlignment = .center
        resumeStartButton.addTarget(self, action: #selector(buttonStartResumeAction), for: .touchUpInside)
        resumeStartButton.clipsToBounds = true
        resumeStartButton.alpha = 0
        self.generalView.addSubview(resumeStartButton)
        self.generalView.bringSubview(toFront: resumeStartButton)
    }
    
    //Adding four buttons/images to resume options - to see my details
    public func addFourButtonResumeOptions(view : UIView) {
        //Button 1
        buttonCake = UIButton(frame: CGRect(x: 0,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/4,height: 400))
        buttonCake.setImage(UIImage(named: "cake.png"), for: .normal)
        buttonCake.addTarget(self, action: #selector(buttonCakeAction), for: .touchUpInside)
        buttonCake.clipsToBounds = true
        buttonCake.imageView?.contentMode = .scaleAspectFit
        buttonCake.alpha = 0
        
        //Button 2
        buttonEducation = UIButton(frame: CGRect(x: view.frame.size.width/4,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/4,height: 400))
        buttonEducation.setImage(UIImage(named: "education.png"), for: .normal)
        buttonEducation.addTarget(self, action: #selector(buttonEducationAction), for: .touchUpInside)
        buttonEducation.clipsToBounds = true
        buttonEducation.imageView?.contentMode = .scaleAspectFit
        buttonEducation.alpha = 0
        
        //Button 3
        buttonMasters = UIButton(frame: CGRect(x: view.frame.size.width/2,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/4,height: 400))
        buttonMasters.setImage(UIImage(named: "research.png"), for: .normal)
        buttonMasters.addTarget(self, action: #selector(buttonMastersAction), for: .touchUpInside)
        buttonMasters.clipsToBounds = true
        buttonMasters.imageView?.contentMode = .scaleAspectFit
        buttonMasters.alpha = 0
        
        //Button 4
        buttonApps = UIButton(frame: CGRect(x: view.frame.size.width*3 / 4,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/4,height: 400))
        buttonApps.setImage(UIImage(named: "apps.png"), for: .normal)
        buttonApps.addTarget(self, action: #selector(buttonAppsAction), for: .touchUpInside)
        buttonApps.clipsToBounds = true
        buttonApps.imageView?.contentMode = .scaleAspectFit
        buttonApps.alpha = 0
        
        //Hiding them initially
        isCakeOpen = false
        isEducationOpen = false
        isMastersOpen = false
        isAppsOpen = false
        
        //Adding to their superview
        view.addSubview(buttonCake)
        view.addSubview(buttonEducation)
        view.addSubview(buttonMasters)
        view.addSubview(buttonApps)
    }
    
    /* -------------------- All button, gesture and more actions - selectors ------------------ */
    
    //Update time timer action method here to update time in lock screen
    @objc public func updateTimeTimerAction() {
        DispatchQueue.main.async {
            self.displayDateTimeLabel()
            self.animateTimeLabel(delay : 0.0 , label : self.label, animationDuration : 0.0)
        }
    }
    
    //Swipe right gesture action
    @objc public func slideToRightWithGestureRecognizer(gestureRecognizer:UISwipeGestureRecognizer) {
        timer?.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall1.jpg")!)
            self.removeLockScreenView()
        })
    }
    
    //Home button action on main page
    @objc  func homeButtonAction(sender:UIButton!) {
        self.removeGeneralView()
        self.genderAgeSelectionView.removeFromSuperview()
        self.buttonGenderMale.removeFromSuperview()
        self.buttonGenderFemale.removeFromSuperview()
        self.buttonAge40Above.removeFromSuperview()
        self.resumeStartButton.removeFromSuperview()
        self.buttonAge3140.removeFromSuperview()
        self.buttonAge2130.removeFromSuperview()
        self.buttonAgeBelow20.removeFromSuperview()
        self.buttonSeeCalorie.removeFromSuperview()
        self.buttonCalorieClick.removeFromSuperview()
        self.calorieShowView.removeFromSuperview()
        self.mealView.removeFromSuperview()
        self.buttonMealType1.removeFromSuperview()
        self.buttonMealType2.removeFromSuperview()
        self.buttonMealType3.removeFromSuperview()
        self.buttonMealType4.removeFromSuperview()
        self.buttonMealType5.removeFromSuperview()
        self.label.removeFromSuperview()
        self.labelTotalCalories.removeFromSuperview()
        self.pulseEffect?.removeFromSuperlayer()
        self.mealView.removeFromSuperview()
         currentCountResumeImage = 0
          clearFishScene()
        self.finalMealView.removeFromSuperview()
        self.buttonDietPredictor.removeFromSuperview()
        self.buttonMealSuggestion1.removeFromSuperview()
        self.buttonMealSuggestion2.removeFromSuperview()
        self.buttonMealSuggestion3.removeFromSuperview()
        self.buttonMealSuggestion4.removeFromSuperview()
        self.labelSuggestionHeading2.removeFromSuperview()
        self.labelSuggestionHeading1.removeFromSuperview()
        self.labelSuggestionSubHeading.removeFromSuperview()
        
        if resumeTimer != nil {
             resumeTimer.invalidate()
        }
        
        if fishTimer != nil {
            fishTimer?.invalidate()
        }
        
    }
    
    //lock button action on main page
    @objc  func lockButtonAction(sender:UIButton!) {
        removeCollectionView()
        removeButtonsOptionsView()
        addLockScreenView()
        self.removeGeneralView()
        self.genderAgeSelectionView.removeFromSuperview()
        self.buttonGenderMale.removeFromSuperview()
        self.buttonGenderFemale.removeFromSuperview()
        self.buttonAge40Above.removeFromSuperview()
        self.buttonAge3140.removeFromSuperview()
        self.buttonAge2130.removeFromSuperview()
        self.buttonAgeBelow20.removeFromSuperview()
        self.resumeStartButton.removeFromSuperview()
        self.buttonSeeCalorie.removeFromSuperview()
        self.buttonCalorieClick.removeFromSuperview()
        self.calorieShowView.removeFromSuperview()
        self.mealView.removeFromSuperview()
        self.buttonMealType1.removeFromSuperview()
         currentCountResumeImage = 0
          clearFishScene()
        self.buttonMealType2.removeFromSuperview()
        self.buttonMealType3.removeFromSuperview()
        self.buttonMealType4.removeFromSuperview()
        self.buttonMealType5.removeFromSuperview()
        self.label.removeFromSuperview()
        self.labelTotalCalories.removeFromSuperview()
        self.pulseEffect?.removeFromSuperlayer()
        self.mealView.removeFromSuperview()
        self.finalMealView.removeFromSuperview()
        self.buttonDietPredictor.removeFromSuperview()
        self.buttonMealSuggestion1.removeFromSuperview()
        self.buttonMealSuggestion2.removeFromSuperview()
        self.buttonMealSuggestion3.removeFromSuperview()
        self.buttonMealSuggestion4.removeFromSuperview()
        self.labelSuggestionHeading2.removeFromSuperview()
        self.labelSuggestionHeading1.removeFromSuperview()
        self.labelSuggestionSubHeading.removeFromSuperview()
        
        if resumeTimer != nil {
            resumeTimer.invalidate()
        }
        
        if fishTimer != nil {
            fishTimer?.invalidate()
        }
    }
    
    //Slider action - thickness of paint app
    @objc func sliderValueDidChange(sender: UISlider) {
        self.drawView.lineWidth = CGFloat(sender.value * 75)
    }
    
    //Button eraser action - paint app
    @objc  func buttonEraserAction(sender:UIButton!) {
        if isEraserSelected == false {
            isEraserSelected = true
            buttonEraser.backgroundColor = UIColor.gray
            buttonEraser.setTitleColor(UIColor.white, for: .normal)
            self.drawView.drawColor = UIColor.white
        }
        else{
            isEraserSelected = false
            buttonEraser.backgroundColor = UIColor.white
            buttonEraser.setTitleColor(UIColor.black, for: .normal)
            self.drawView.drawColor = lastColorSelected
        }
    }
    
    //Button clear screen action - paint app
    @objc  func buttonClearScreenAction(sender:UIButton!) {
        drawView.lines = []
        drawView.setNeedsDisplay()
    }
    
    //Updating timer action on Resume / details app - yogesh => changing frames after every specific time interval
  @objc func updateResumeFrames() {
        currentCountResumeImage += 1
        if currentCountResumeImage <= 49 {
            let imageName = "resume_" + String(currentCountResumeImage) + ".jpg"
            DispatchQueue.main.async {
                self.resumeImageView.backgroundColor = UIColor.clear
                self.resumeImageView.image = UIImage(named: imageName)
            }
        }
        else{
           
            resumeTimer.invalidate()
            setupStartResumeButton()
            animateButton(button: resumeStartButton)
        }
    }
    
    //Resume get started button pressed
   @objc func buttonStartResumeAction() {
        DispatchQueue.main.async {
            self.resumeStartButton.removeFromSuperview()
            self.resumeImageView.removeFromSuperview()
            self.resumeBackgroundCover = UIImageView(frame:CGRect(x: 0, y : 0, width : self.generalView.frame.size.width, height: self.generalView.frame.size.height))
            
            self.resumeBackgroundCover.image = UIImage(named: "resume_background.png")
            self.resumeBackgroundCover.contentMode = .scaleAspectFit
            self.generalView.addSubview(self.resumeBackgroundCover)
            self.addFourButtonResumeOptions(view : self.generalView)
            self.animateFourButtonsOnce()
        }
    }
    
    //Button Cake Action
   @objc public func buttonCakeAction() {
        if isCakeOpen {
            isCakeOpen = false
            buttonCake.setImage(UIImage(named: "cake.png"), for: .normal)
            buttonCake.clipsToBounds = true
            buttonCake.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonCake, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isCakeOpen = true
            buttonCake.setImage(UIImage(named: "dob.png"), for: .normal)
            buttonCake.clipsToBounds = true
            buttonCake.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonCake, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    //Button Education Action
 @objc  public func buttonEducationAction() {
        if isEducationOpen {
            isEducationOpen = false
            buttonEducation.setImage(UIImage(named: "education.png"), for: .normal)
            buttonEducation.clipsToBounds = true
            buttonEducation.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonEducation, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isEducationOpen = true
            buttonEducation.setImage(UIImage(named: "edu.png"), for: .normal)
            buttonEducation.clipsToBounds = true
            buttonEducation.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonEducation, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    //Button Masters Action
   @objc public func buttonMastersAction() {
        if isMastersOpen {
            isMastersOpen = false
            buttonMasters.setImage(UIImage(named: "research.png"), for: .normal)
            buttonMasters.clipsToBounds = true
            buttonMasters.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMasters, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isMastersOpen = true
            buttonMasters.setImage(UIImage(named: "research_front.png"), for: .normal)
            buttonMasters.clipsToBounds = true
            buttonMasters.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMasters, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    // //Button Apps Action
   @objc public func buttonAppsAction() {
        if isAppsOpen {
            isAppsOpen = false
            buttonApps.setImage(UIImage(named: "apps.png"), for: .normal)
            buttonApps.clipsToBounds = true
            buttonApps.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonApps, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isAppsOpen = true
            buttonApps.setImage(UIImage(named: "apps_front.png"), for: .normal)
            buttonApps.clipsToBounds = true
            buttonApps.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonApps, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    
    /* ------------------- All functions of animating views, buttons, imageviews etc --------------- */
    
    //Animating apple logo
    public func animateAppleLogo(logo : UIImageView, delay: TimeInterval, animationDuration : TimeInterval, springVelocity : CGFloat, springDamping : CGFloat) {
        logo.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        logo.alpha = 1
        UIView.animate(withDuration: animationDuration,
                       delay: delay,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.appleLogo.transform = .identity
            },
                       completion: { (Bool) -> Void in
                        self.addProgressView()
                        
        })
    }
    
    //Animate Label
    public func animateLabel(delay: TimeInterval, label : UILabel) {
        let animationDuration = 2.00
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            label.alpha = 0
        }) { (Bool) -> Void in
            UIView.animate(withDuration: animationDuration, delay: delay, options: [.curveEaseOut], animations: { () -> Void in
                label.alpha = 1
            }, completion: { (Bool) -> Void in
                
            })
        }
    }
    
    //Animate date time label
    public func animateTimeLabel(delay: TimeInterval, label : UILabel, animationDuration : TimeInterval) {
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            label.alpha = 0
        }) { (Bool) -> Void in
            UIView.animate(withDuration: animationDuration, delay: delay, options: [.curveEaseOut], animations: { () -> Void in
                label.alpha = 1
            }, completion: { (Bool) -> Void in
                //Show him the label to swipe to open lock
            })
        }
    }
    
    //Animate swipe label - swipe labe to unlock on lock screen
    public func animateSwipeLabel(delay: TimeInterval, label : UILabel) {
        label.frame.origin.x = -self.label.frame.width/2
        UIView.animate(withDuration: 10, delay: 0, options: ([.curveLinear, .repeat]), animations: {() -> Void in
            label.frame.origin.x = self.view.frame.width
        }, completion:  { _ in })
    }
    
    //Animate home and lock screen buttons on the main page
    public func animateButtonOptionView(view: UIView, delay: TimeInterval, animationDuration : TimeInterval, springVelocity : CGFloat, springDamping : CGFloat) {
        view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: animationDuration,
                       delay: delay,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        view.alpha = 1
                        view.transform = .identity
            },
                       completion: nil)
    }
    
    //Animate button - general - more than one button is calling this function again and again.
    public func animateButton(button : UIButton) {
        button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        button.alpha = 1
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        button.transform = .identity
            },
                       completion: nil)
    }
    
    //Animating four buttons - resume / details options
    public func animateFourButtonsOnce() {
        buttonCake.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonCake.alpha = 1
        buttonEducation.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonEducation.alpha = 1
        buttonMasters.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonMasters.alpha = 1
        buttonApps.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonApps.alpha = 1
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.buttonCake.transform = .identity
                        self?.buttonEducation.transform = .identity
                        self?.buttonMasters.transform = .identity
                        self?.buttonApps.transform = .identity
                        PlaygroundPage.current.assessmentStatus = .pass(message: "\("Great job! Do click on every icon before leaving.")\n\n[**Next Page**](@next)")
            },
                       completion: nil)
    }
}

/* -------------------- CALORIES GENERATOR APP CODE ---------------- */
extension LiveViewiPadViewController {
    
    //Base for gender age selection
    func setupGenderAgeSceneView() {
        genderAgeSelectionView.removeFromSuperview()
        genderAgeSelectionView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height : self.view.frame.size.height - 160)
        genderAgeSelectionView.backgroundColor = UIColor(patternImage: UIImage(named: "background_diet.png")!)
        setupGenderAgeView(genderAgeView : genderAgeSelectionView)
        self.view.addSubview(genderAgeSelectionView)
        genderAgeSelectionView.bounceIn()
    }
    
    func removeBtnFromSuperView(btn : UIButton) {
        btn.removeFromSuperview()
    }
    
    func setupGenderAgeView(genderAgeView : UIView) {
        //Label first heading show - Select gender and age category
        label.removeFromSuperview()
        labelAgeSelector.removeFromSuperview()
        removeBtnFromSuperView(btn: buttonGenderMale)
        removeBtnFromSuperView(btn: buttonGenderFemale)
        removeBtnFromSuperView(btn: buttonAge40Above)
        removeBtnFromSuperView(btn: buttonAge3140)
        removeBtnFromSuperView(btn: buttonAge2130)
        removeBtnFromSuperView(btn: buttonAgeBelow20)
        
        isAbove40Selected = false
        isBelow20Selected = false
        is2130Selected = false
        is3140Selected = false
        isMaleSelected = false
        isFemaleSelected = false
        
        label.frame = CGRect(x: 0, y: 20 , width: genderAgeView.frame.size.width, height: 60)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.text = "Select Gender"
        label.textAlignment = .center
        let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let fontMain = UIFont(name: "OpenSans-Bold", size:  30.0)
        label.font = fontMain
        label.alpha = 1
        label.adjustsFontSizeToFitWidth = true
        
        //2 Buttons for gender now in same line
        //Button Male
        buttonGenderMale = UIButton(frame: CGRect(x: (genderAgeView.frame.size.width/4) - 20,y: 100, width: genderAgeView.frame.size.width/4 + 10,height: 70))
        buttonCustomisation(btn: buttonGenderMale, isPressed : false, title : "MALE")
        buttonGenderMale.addTarget(self, action: #selector(buttonMaleAction), for: .touchUpInside)
        
        //Button Female
        buttonGenderFemale = UIButton(frame: CGRect(x: genderAgeView.frame.size.width/2 + 20,y: 100, width: genderAgeView.frame.size.width/4 + 10,height: 70))
        buttonCustomisation(btn: buttonGenderFemale, isPressed : false, title : "FEMALE")
        buttonGenderFemale.addTarget(self, action: #selector(buttonFemaleAction), for: .touchUpInside)
        
        //label age heading
        labelAgeSelector.removeFromSuperview()
        labelAgeSelector.frame = CGRect(x: 0, y: 230 , width: genderAgeView.frame.size.width, height: 60)
        labelAgeSelector.lineBreakMode = .byWordWrapping
        labelAgeSelector.numberOfLines = 0
        labelAgeSelector.textColor = UIColor.black
        labelAgeSelector.text = "Select Age"
        labelAgeSelector.textAlignment = .center
        labelAgeSelector.font = fontMain
        labelAgeSelector.alpha = 1
        labelAgeSelector.adjustsFontSizeToFitWidth = true
        
        //Button age categories
        //Button  below 20
        let widthEachButton = ((genderAgeView.frame.size.width*5) - 300) / 24
        buttonAgeBelow20 = UIButton(frame: CGRect(x: genderAgeView.frame.size.width/12 + 10,y: 310, width: widthEachButton,height: 70))
        buttonCustomisation(btn: buttonAgeBelow20, isPressed : false, title : "Below 20")
        buttonAgeBelow20.addTarget(self, action: #selector(buttonAgeBelow20Action), for: .touchUpInside)
        
        //Button 21 - 30
        buttonAge2130 = UIButton(frame: CGRect(x: genderAgeView.frame.size.width/12 + widthEachButton + 20,y: 310, width: widthEachButton,height: 70))
        buttonCustomisation(btn: buttonAge2130, isPressed : false, title : "21 - 30")
        buttonAge2130.addTarget(self, action: #selector(buttonAge2130Action), for: .touchUpInside)
        
        //Button 31 - 40
        buttonAge3140 = UIButton(frame: CGRect(x: genderAgeView.frame.size.width/12 + widthEachButton * 2 + 30,y: 310, width: widthEachButton,height: 70))
        buttonCustomisation(btn: buttonAge3140, isPressed : false, title : "31 - 40")
        buttonAge3140.addTarget(self, action: #selector(buttonAge3140Action), for: .touchUpInside)
        
        //Button above 40
        buttonAge40Above = UIButton(frame: CGRect(x: genderAgeView.frame.size.width/12 + widthEachButton * 3 + 40,y: 310, width: widthEachButton,height: 70))
        buttonCustomisation(btn: buttonAge40Above, isPressed : false, title : "Above 40")
        buttonAge40Above.addTarget(self, action: #selector(buttonAge40AboveAction), for: .touchUpInside)
        
        genderAgeView.addSubview(buttonAgeBelow20)
        genderAgeView.addSubview(buttonAge2130)
        genderAgeView.addSubview(buttonAge3140)
        genderAgeView.addSubview(buttonAge40Above)
        genderAgeView.addSubview(buttonGenderMale)
        genderAgeView.addSubview(buttonGenderFemale)
        genderAgeView.addSubview(label)
        genderAgeView.addSubview(labelAgeSelector)
    }
    
    func setupSeeCaloriesButton(tempview : UIView) {
        self.buttonSeeCalorie.removeFromSuperview()
        buttonSeeCalorie = UIButton(frame: CGRect(x: tempview.frame.size.width/3,y: tempview.frame.size.height - 80, width: tempview.frame.size.width/3,height: 60))
        buttonSeeCalorie.layer.cornerRadius = 10.0
        buttonSeeCalorie.alpha = 1
        buttonSeeCalorie.setTitle("See Calories!", for: .normal)
        buttonSeeCalorie.layer.masksToBounds = true
        buttonSeeCalorie.backgroundColor = UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1)
        buttonSeeCalorie.titleLabel?.textAlignment = .center
        buttonSeeCalorie.addTarget(self, action: #selector(buttonSeeCalorieAction), for: .touchUpInside)
        tempview.addSubview(buttonSeeCalorie)
    }
    
    func isButtonSeeCalrieShow() -> Bool {
        if (isMaleSelected == true || isFemaleSelected == true) {
            if (isAbove40Selected == true || is3140Selected == true || is2130Selected == true || isBelow20Selected == true) {
                return true
            }
            return false
        }
        return false
    }
    
    func buttonCustomisation(btn : UIButton, isPressed : Bool, title: String){
        if isPressed{
            btn.backgroundColor =  UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1)
            btn.setTitleColor(UIColor.white, for: .normal)
        }
        else{
            btn.backgroundColor = UIColor.white
            btn.titleLabel?.textAlignment = .center
            btn.layer.cornerRadius = 10
            btn.layer.borderColor =  UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1).cgColor
            btn.layer.borderWidth = 2.0
            btn.layer.masksToBounds = true
            btn.setTitleColor( UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1), for: .normal)
            btn.setTitle(title, for:.normal)
            buttonGenderMale.clipsToBounds = true
        }
    }
    
    //btn see calorie action
    @objc  func buttonSeeCalorieAction(sender:UIButton!) {
        //Hide this genderage selection view and present another view which shows you need this much amount of calories to be healthy
        self.genderAgeSelectionView.bounceOut(completion :   { (Bool) -> Void in
            self.setupCaoriesShowView()
            self.calorieShowView.bounceIn(completion :   { (Bool) -> Void in
                self.genderAgeSelectionView.removeFromSuperview()
                self.genderAgeSelectionView.bounceIn()
            })
        })
    }
    //Button actions for this feature here
    
    //Home button action on main page
    @objc  func buttonMaleAction(sender:UIButton!) {
        //male button not clicked
        if (isMaleSelected == false) {
            //female button also not clicked i.e both are not clicked yet
            if (isFemaleSelected==false) {
                isMaleSelected = true
                isFemaleSelected = false
                DispatchQueue.main.async {
                    if self.isButtonSeeCalrieShow() == true {
                        self.setupSeeCaloriesButton(tempview : self.genderAgeSelectionView)
                        self.animateButton(button: self.buttonSeeCalorie)
                    }
                    self.buttonCustomisation(btn : self.buttonGenderMale, isPressed : true, title : "MALE")
                    //  self.buttonCustomisation(btn : self.buttonGenderFemale, isPressed : false, title : "FEMALE")
                }
            }
                //male button not clicked, female button clicked
            else{
                isMaleSelected = true
                isFemaleSelected = false
                DispatchQueue.main.async {
                    if self.isButtonSeeCalrieShow() == true {
                        self.setupSeeCaloriesButton(tempview : self.genderAgeSelectionView)
                        self.animateButton(button: self.buttonSeeCalorie)
                    }
                    self.buttonCustomisation(btn : self.buttonGenderMale, isPressed : true, title : "MALE")
                    self.buttonCustomisation(btn : self.buttonGenderFemale, isPressed : false, title : "FEMALE")
                }
            }
        }
    }
    
    //Home button action on main page
    @objc  func buttonFemaleAction(sender:UIButton!) {
        //male button clicked
        if (isFemaleSelected == false) {
            //female button also not clicked and male button also not clicked
            if (isMaleSelected==false) {
                isMaleSelected = false
                isFemaleSelected = true
                DispatchQueue.main.async {
                    if self.isButtonSeeCalrieShow() == true {
                        self.setupSeeCaloriesButton(tempview : self.genderAgeSelectionView)
                        self.animateButton(button: self.buttonSeeCalorie)
                    }
                    self.buttonCustomisation(btn : self.buttonGenderFemale, isPressed : true, title : "FEMALE")
                }
            }
                //male button clicked, female button not clicked
            else{
                isMaleSelected = false
                isFemaleSelected = true
                DispatchQueue.main.async {
                    if self.isButtonSeeCalrieShow() == true {
                        self.setupSeeCaloriesButton(tempview : self.genderAgeSelectionView)
                        self.animateButton(button: self.buttonSeeCalorie)
                    }
                    self.buttonCustomisation(btn : self.buttonGenderMale, isPressed : false, title : "MALE")
                    self.buttonCustomisation(btn : self.buttonGenderFemale, isPressed : true, title : "FEMALE")
                }
            }
        }
    }
    
    //Home button action on main page
    @objc  func buttonAgeBelow20Action(sender:UIButton!) {
        if isBelow20Selected == false{
            isBelow20Selected = true
            is2130Selected = false
            is3140Selected = false
            isAbove40Selected = false
            DispatchQueue.main.async {
                if self.isButtonSeeCalrieShow() == true {
                    self.setupSeeCaloriesButton(tempview : self.genderAgeSelectionView)
                    self.animateButton(button: self.buttonSeeCalorie)
                }
                self.buttonCustomisation(btn : self.buttonAgeBelow20, isPressed : true, title : "Below 20")
                self.buttonCustomisation(btn : self.buttonAge2130, isPressed : false, title : "21 - 30")
                self.buttonCustomisation(btn : self.buttonAge3140, isPressed : false, title : "31 - 40")
                self.buttonCustomisation(btn : self.buttonAge40Above, isPressed : false, title : "Above 40")
            }
        }
    }
    
    //Home button action on main page
    @objc  func buttonAge2130Action(sender:UIButton!) {
        if is2130Selected == false{
            is2130Selected = true
            isBelow20Selected = false
            is3140Selected = false
            isAbove40Selected = false
            DispatchQueue.main.async {
                if self.isButtonSeeCalrieShow() == true {
                    self.setupSeeCaloriesButton(tempview : self.genderAgeSelectionView)
                    self.animateButton(button: self.buttonSeeCalorie)
                }
                self.buttonCustomisation(btn : self.buttonAgeBelow20, isPressed : false, title : "Below 20")
                self.buttonCustomisation(btn : self.buttonAge2130, isPressed : true, title : "21 - 30")
                self.buttonCustomisation(btn : self.buttonAge3140, isPressed : false, title : "31 - 40")
                self.buttonCustomisation(btn : self.buttonAge40Above, isPressed : false, title : "Above 40")
            }
        }
    }
    
    //Home button action on main page
    @objc  func buttonAge3140Action(sender:UIButton!) {
        if is3140Selected == false{
            is3140Selected = true
            isBelow20Selected = false
            is2130Selected = false
            isAbove40Selected = false
            DispatchQueue.main.async {
                if self.isButtonSeeCalrieShow() == true {
                    self.setupSeeCaloriesButton(tempview : self.genderAgeSelectionView)
                    self.animateButton(button: self.buttonSeeCalorie)
                }
                self.buttonCustomisation(btn : self.buttonAgeBelow20, isPressed : false, title : "Below 20")
                self.buttonCustomisation(btn : self.buttonAge2130, isPressed : false, title : "21 - 30")
                self.buttonCustomisation(btn : self.buttonAge3140, isPressed : true, title : "31 - 40")
                self.buttonCustomisation(btn : self.buttonAge40Above, isPressed : false, title : "Above 40")
            }
        }
    }
    
    //Home button action on main page
    @objc  func buttonAge40AboveAction(sender:UIButton!) {
        if isAbove40Selected == false {
            isAbove40Selected = true
            isBelow20Selected = false
            is2130Selected = false
            is3140Selected = false
            DispatchQueue.main.async {
                if self.isButtonSeeCalrieShow() == true {
                    self.setupSeeCaloriesButton(tempview : self.genderAgeSelectionView)
                    self.animateButton(button: self.buttonSeeCalorie)
                }
                self.buttonCustomisation(btn : self.buttonAgeBelow20, isPressed : false, title : "Below 20")
                self.buttonCustomisation(btn : self.buttonAge2130, isPressed : false, title : "21 - 30")
                self.buttonCustomisation(btn : self.buttonAge3140, isPressed : false, title : "31 - 40")
                self.buttonCustomisation(btn : self.buttonAge40Above, isPressed : true, title : "Above 40")
            }
        }
    }
    
    public func setupCaoriesShowView() {
        //calorieShowView
        calorieShowView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height : self.view.frame.size.height - 160)
        calorieShowView.backgroundColor = UIColor(patternImage: UIImage(named: "background_diet.png")!)
        // calorieShowView.isHidden = true
        setupCalorieShowSubViews(calorieView : calorieShowView)
        self.view.addSubview(calorieShowView)
    }
    func setupCalorieShowSubViews(calorieView : UIView) {
        //button add center and then animation also
        //Label first heading show - Select gender and age category
        label.removeFromSuperview()
        label.frame = CGRect(x: 0, y: 20 , width: calorieView.frame.size.width, height: 150)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.black
        //   label.text = "Calories needed per day \n Please tap on calorie"
        label.textAlignment = .center
        
        let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let fontMain = UIFont(name: "OpenSans-Bold", size:  30.0)
        let fontSecondary = UIFont(name: "OpenSans-Bold", size:  18.0)
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        let str1 = "Calories needed per day \n"
        
        let str2 = "Please tap on it"
        let labelText = NSMutableAttributedString.init(string: str1 + str2)
        labelText.setAttributes([NSAttributedStringKey.font: fontMain,
                                 NSAttributedStringKey.foregroundColor: UIColor.black],
                                range: NSMakeRange(0, str1.count - 1))
        labelText.setAttributes([NSAttributedStringKey.font: fontSecondary,
                                 NSAttributedStringKey.foregroundColor: UIColor.gray],
                                range: NSMakeRange(str1.count,str2.count))
        label.attributedText = labelText
        
        label.alpha = 1
        label.adjustsFontSizeToFitWidth = true
        
        let fontURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        let font = UIFont(name: "OpenSans-Bold", size: 50)!
        
        //button calorie show and clickable to next screen
        buttonCalorieClick = UIButton(frame: CGRect(x: calorieView.frame.size.width / 2 - 120,y: calorieView.frame.size.height / 2 - 120, width: 240,height: 240))
        let calorieString = String(getCalories())
        buttonCalorieClick.backgroundColor =  UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1)
        buttonCalorieClick.titleLabel?.textAlignment = .center
        buttonCalorieClick.layer.cornerRadius = 0.5 * buttonCalorieClick.bounds.size.width
        buttonCalorieClick.layer.borderColor =  UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1).cgColor
        buttonCalorieClick.titleLabel?.font =  font
        buttonCalorieClick.layer.borderWidth = 2.0
        buttonCalorieClick.layer.masksToBounds = true
        buttonCalorieClick.setTitleColor(UIColor.white, for: .normal)
        buttonCalorieClick.setTitle(calorieString, for:.normal)
        buttonCalorieClick.clipsToBounds = true
        buttonCalorieClick.addTarget(self, action: #selector(buttonCalorieClickAction), for: .touchUpInside)
        
        pulseEffect = CustomPulseAnimation(repeatCount: Float.infinity, radius: calorieView.frame.size.width/3, position:buttonCalorieClick.center)
        calorieView.layer.insertSublayer(pulseEffect!, below: buttonCalorieClick.layer)
        buttonCalorieClick.alpha = 0
        calorieView.addSubview(buttonCalorieClick)
        calorieView.addSubview(label)
        animateiCalorieButton(btn: buttonCalorieClick, delay: 0.3, animationDuration : 0.4, springVelocity : 0.0, springDamping : 1.0)
    }
    
    //Home button action on main page
    @objc  func buttonCalorieClickAction(sender:UIButton!) {
        //Hide calorie view and show breakfast view
        calorieShowView.bounceOut(completion :   { (Bool) -> Void in
            //Setup breakfast / lunch / dinner view
            self.calorieShowView.removeFromSuperview()
            
            //  self.pulseEffect?.removeFromSuperlayer()
            self.setupMealView()
            self.mealView.bounceIn(completion :   { (Bool) -> Void in
                //Animate 5 buttons now
                self.animateFiveButtonsMealOptionsOnce()
                self.calorieShowView.bounceIn()
            })
        })
    }
    
    public func setupMealView() {
        mealView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height : self.view.frame.size.height - 160)
        mealView.backgroundColor = UIColor(patternImage: UIImage(named: "background_diet.png")!)
        self.view.addSubview(mealView)
        setupMealDetailedView(mealView : mealView)
    }
    
    public func setupMealDetailedView(mealView : UIView) {
        //Add label at the top saying - what did you have in breakfast / lunch / dinner
        label.removeFromSuperview()
        label.frame = CGRect(x: 0, y: 10 , width: mealView.frame.size.width, height: 70)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.textAlignment = .center
        let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        var fontMain = UIFont(name: "OpenSans-Bold", size:  20.0)
        var fontSecondary = UIFont(name: "OpenSans-Bold", size:  30.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        let str1 = "What did you have in "
        let str2 = getConsumedMealName()
        let str3 = "?"
        
        let labelText = NSMutableAttributedString.init(string: str1 + str2 + str3)
        labelText.setAttributes([NSAttributedStringKey.font: fontMain,
                                 NSAttributedStringKey.foregroundColor: UIColor.black],
                                range: NSMakeRange(0, str1.count - 1))
        labelText.setAttributes([NSAttributedStringKey.font: fontSecondary,
                                 NSAttributedStringKey.foregroundColor:  UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1)],
                                range: NSMakeRange(str1.count,str2.count))
        labelText.setAttributes([NSAttributedStringKey.font: fontMain,
                                 NSAttributedStringKey.foregroundColor: UIColor.black],
                                range: NSMakeRange(str2.count,str3.count))
        label.attributedText = labelText
        label.alpha = 1
        label.adjustsFontSizeToFitWidth = true
        
        labelTotalCalories.removeFromSuperview()
        labelTotalCalories.frame = CGRect(x: 0, y: 100 , width: mealView.frame.size.width, height: 80)
        labelTotalCalories.lineBreakMode = .byWordWrapping
        labelTotalCalories.numberOfLines = 0
        labelTotalCalories.textColor = UIColor.black
        labelTotalCalories.textAlignment = .center
        
        fontMain = UIFont(name: "OpenSans-Bold", size:  20.0)
        fontSecondary = UIFont(name: "OpenSans-Bold", size:  40.0)
        labelTotalCalories.numberOfLines = 0
        labelTotalCalories.lineBreakMode = .byWordWrapping
        var strTemp1 = "Total Calories: "
        var strTemp2 = String(getCalories())
        
        let labelTextTotalCalorie = NSMutableAttributedString.init(string: strTemp1 + strTemp2)
        labelTextTotalCalorie.setAttributes([NSAttributedStringKey.font: fontMain,
                                             NSAttributedStringKey.foregroundColor: UIColor.gray],
                                            range: NSMakeRange(0, strTemp1.count - 1))
        labelTextTotalCalorie.setAttributes([NSAttributedStringKey.font: fontSecondary,
                                             NSAttributedStringKey.foregroundColor: UIColor.red],
                                            range: NSMakeRange(strTemp1.count,strTemp2.count))
        labelTotalCalories.attributedText = labelTextTotalCalorie
        labelTotalCalories.alpha = 1
        labelTotalCalories.adjustsFontSizeToFitWidth = true
        
        
        
        labelCaloriesRemaining.removeFromSuperview()
        labelCaloriesRemaining.frame = CGRect(x: 0, y: mealView.frame.size.height - 180 , width: mealView.frame.size.width, height: 60)
        labelCaloriesRemaining.lineBreakMode = .byWordWrapping
        labelCaloriesRemaining.numberOfLines = 0
        labelCaloriesRemaining.textColor = UIColor.black
        labelCaloriesRemaining.textAlignment = .center
        
        
        strTemp1 = "Calories Remaining: "
        strTemp2 = String(getCalories())
        
        let labelCaloriesRemainingText = NSMutableAttributedString.init(string: strTemp1 + strTemp2)
        labelCaloriesRemainingText.setAttributes([NSAttributedStringKey.font: fontMain,
                                                  NSAttributedStringKey.foregroundColor: UIColor.gray],
                                                 range: NSMakeRange(0, strTemp1.count - 1))
        labelCaloriesRemainingText.setAttributes([NSAttributedStringKey.font: fontSecondary,
                                                  NSAttributedStringKey.foregroundColor: UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1)],
                                                 range: NSMakeRange(strTemp1.count,strTemp2.count))
        labelCaloriesRemaining.attributedText = labelCaloriesRemainingText
        labelCaloriesRemaining.alpha = 1
        labelCaloriesRemaining.adjustsFontSizeToFitWidth = true
        
        
        
        //One more button of see your diet prediction
        
        
        mealView.addSubview(labelCaloriesRemaining)
        mealView.addSubview(labelTotalCalories)
        addFiveButtonMealOptions(view : mealView)
        mealView.addSubview(label)
        
    }
    
    public func showDietPredictorButton(){
        buttonDietPredictor.removeFromSuperview()
        buttonDietPredictor = UIButton(frame: CGRect(x: self.mealView.frame.size.width/3,y: self.mealView.frame.size.height - 80, width: self.mealView.frame.size.width/3,height: 60))
        buttonDietPredictor.layer.cornerRadius = 10.0
        buttonDietPredictor.alpha = 1
        buttonDietPredictor.setTitle("See Diet!", for: .normal)
        buttonDietPredictor.layer.masksToBounds = true
        buttonDietPredictor.backgroundColor = UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1)
        buttonDietPredictor.titleLabel?.textAlignment = .center
        buttonDietPredictor.addTarget(self, action: #selector(buttonSeeDietPredictedAction), for: .touchUpInside)
        self.mealView.addSubview(buttonDietPredictor)
    }
    
    //Home button action on main page
    @objc  func buttonSeeDietPredictedAction(sender:UIButton!) {
        //Predcit diet button pressed
        // hide this meal view and show him the fina view
        //Bounce out the meal view and remove all sub views from it and bounce in final view
        
        //Hide calorie view and show breakfast view
        mealView.bounceOut(completion :   { (Bool) -> Void in
            //Setup breakfast / lunch / dinner view
            self.mealView.removeFromSuperview()
            //  self.pulseEffect?.removeFromSuperlayer()
            self.setupFinalMealView()
            self.finalMealView.bounceIn(completion :   { (Bool) -> Void in
                //Animate 5 buttons now
                // self.animateFiveButtonsMealOptionsOnce()
                
                if self.getConsumedMealName() == "Lunch" {
                    //Animate both buttons at one time
                    self.animateMealSuggestionsButton(btn1: self.buttonMealSuggestion1, btn2: self.buttonMealSuggestion2)
                }
                else if self.getConsumedMealName() == "Dinner" {
                    //Animate both buttons at one time
                    self.animateMealSuggestionsBreakfastButton(btn1: self.buttonMealSuggestion1, btn2 : self.buttonMealSuggestion2, btn3 : self.buttonMealSuggestion3 )
                }
                else{
                    //Show animated all buttons here
                    self.animateMealSuggestionsLunchDinnerButton(btn1: self.buttonMealSuggestion1, btn2 : self.buttonMealSuggestion2, btn3 : self.buttonMealSuggestion3, btn4: self.buttonMealSuggestion4)
                }
                
                self.mealView.bounceIn()
            })
        })
    }
    
    public func setupFinalMealView() {
        finalMealView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height : self.view.frame.size.height - 160)
        finalMealView.backgroundColor = UIColor(patternImage: UIImage(named: "background_diet.png")!)
        self.view.addSubview(finalMealView)
        setupDetailedFinalMealView(finaMealView : finalMealView)
    }
    
    
    public func setupDetailedFinalMealView(finaMealView : UIView) {
        
        //lunch consumed meal - show him options for dinner
        if getConsumedMealName() == "Lunch" {
            
            //Check how many calories left for dinner now
            // if calories left < 500 - show him light dinner else show him 2 options more
            
            let caloriesLeftForDay = getRemainingCalories(totalCalories : getCalories()) - 500
            
            var imageOption1 = ""
            var imageOption2 = ""
            
            if caloriesLeftForDay <= 300 {
                //Show him 2 options for DINNER - light options two
                imageOption1 = "dinner_low.png"
                imageOption2 = "dinner_light_more.png"
            }
            else if caloriesLeftForDay <= 400 {
                //show him 2 options - light 1 + 1 medium
                imageOption1 = "dinner_7.png"
                imageOption2 = "dinner_medium.png"
            }
            else if caloriesLeftForDay <= 500 {
                //show him 2 options - light 1 + 1 medium
                imageOption1 = "dinner_low.png"
                imageOption2 = "dinner_7.png"
            }
            else if caloriesLeftForDay <= 600 {
                //show him 2 options - light 1 + 1 medium
                imageOption1 = "dinner_medium.png"
                imageOption2 = "dinner_6.png"
            }
            else if caloriesLeftForDay <= 700 {
                //show him 2 options - light 1 + 1 medium
                imageOption1 = "dinner_low.png"
                imageOption2 = "dinner_6.png"
            }
            else  if caloriesLeftForDay <= 800 {
                //show him 2 options - light 1 + 1 medium
                imageOption1 = "dinner_low.png"
                imageOption2 = "dinner_8png"
            }
            else if caloriesLeftForDay <= 1000 {
                //show him 2 options - light 1 + 1 medium
                imageOption1 = "dinner_9.png"
                imageOption2 = "dinner_low.png"
                
            }
            else if caloriesLeftForDay <= 1200 {
                //show him 2 options - light 1 + 1 medium
                imageOption1 = "dinner_low.png"
                imageOption2 = "dinner_7.png"
            }
            else if caloriesLeftForDay <= 1400 {
                //show him 2 options - medium 1 + 1 high
                imageOption1 = "dinner_medium.png"
                imageOption2 = "dinner_7.png"
            }
            else{
                //show him 2 options - medium 1 + 1 high
                imageOption1 = "dinner_medium.png"
                imageOption2 = "dinner_high.png"
            }
            
            //Show him label - as per your calories - we have suggestions for you.
            labelSuggestionHeading1.removeFromSuperview()
            labelSuggestionHeading1.frame = CGRect(x: 20, y: 10 , width: finaMealView.frame.size.width - 40, height: 70)
            labelSuggestionHeading1.lineBreakMode = .byWordWrapping
            labelSuggestionHeading1.numberOfLines = 0
            labelSuggestionHeading1.textColor = UIColor.black
            labelSuggestionHeading1.textAlignment = .center
            let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
            CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
            let fontMain = UIFont(name: "OpenSans-Bold", size:  20.0)
            var fontSecondary = UIFont(name: "OpenSans-Bold", size:  30.0)
            
            let str1 = "Based on your previous meal & calories, We have some suggestions for your Dinner"
            
            let labelText = NSMutableAttributedString.init(string: str1)
            labelText.setAttributes([NSAttributedStringKey.font: fontMain,
                                     NSAttributedStringKey.foregroundColor: UIColor.black],
                                    range: NSMakeRange(0, str1.count))
            labelSuggestionHeading1.attributedText = labelText
            labelSuggestionHeading1.alpha = 1
            labelSuggestionHeading1.adjustsFontSizeToFitWidth = true
            
            let strA = "Total Calories : " +  String(getCalories())
            let strB = "Calories consumed in Lunch : " + String(getCalories() - getRemainingCalories(totalCalories : getCalories()))
            let strC = "Breakfast (Assumed) : 500"
            let strD = "Calories Left for Dinner : " + String(caloriesLeftForDay)
            
            let finalString = strA + "\n" + strB + "\n" + strC + "\n" + strD
            
            
            //Show him label - as per your calories - we have suggestions for you.
            labelSuggestionSubHeading.removeFromSuperview()
            labelSuggestionSubHeading.frame = CGRect(x: 20, y: finalMealView.frame.height/2 - 170 , width: finaMealView.frame.size.width - 20, height: 130)
            labelSuggestionSubHeading.lineBreakMode = .byWordWrapping
            labelSuggestionSubHeading.numberOfLines = 0
            labelSuggestionSubHeading.textColor = UIColor.black
            labelSuggestionSubHeading.textAlignment = .center
            
            
            
            let labelTextSub = NSMutableAttributedString.init(string: finalString)
            labelTextSub.setAttributes([NSAttributedStringKey.font: fontMain,
                                        NSAttributedStringKey.foregroundColor: UIColor.gray],
                                       range: NSMakeRange(0, finalString.count))
            labelSuggestionSubHeading.attributedText = labelTextSub
            labelSuggestionSubHeading.alpha = 1
            labelSuggestionSubHeading.adjustsFontSizeToFitWidth = true
            
            //Show him 2 buttons now
            //Button Suggestion 1
            buttonMealSuggestion1 = UIButton(frame: CGRect(x: 0,y: finaMealView.frame.size.height / 2, width: finaMealView.frame.size.width/2,height: finaMealView.frame.size.height / 2))
            buttonMealSuggestion1.setImage(UIImage(named: imageOption1), for: .normal)
            // buttonMealSuggestion1.addTarget(self, action: #selector(buttonMealSuggestion1Action), for: .touchUpInside)
            buttonMealSuggestion1.clipsToBounds = true
            buttonMealSuggestion1.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion1.alpha = 0
            
            //Button Suggestion 2
            buttonMealSuggestion2 = UIButton(frame: CGRect(x: finaMealView.frame.size.width/2,y: finaMealView.frame.size.height / 2, width: view.frame.size.width/2,height: finaMealView.frame.size.height / 2))
            buttonMealSuggestion2.setImage(UIImage(named: imageOption2), for: .normal)
            //  buttonMealSuggestion2.addTarget(self, action: #selector(buttonMealSuggestion2Action), for: .touchUpInside)
            buttonMealSuggestion2.clipsToBounds = true
            buttonMealSuggestion2.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion2.alpha = 0
            
            finalMealView.addSubview(buttonMealSuggestion1)
            finalMealView.addSubview(buttonMealSuggestion2)
            finalMealView.addSubview(labelSuggestionSubHeading)
            finalMealView.addSubview(labelSuggestionHeading1)
            
        }
            //Dinner consumed meal - show him options for next day breakfast
        else if getConsumedMealName() == "Dinner" {
            
            //Show him label - as per your calories - we have suggestions for you.
            labelSuggestionHeading1.removeFromSuperview()
            labelSuggestionHeading1.frame = CGRect(x: 10, y: 10 , width: finaMealView.frame.size.width - 20, height: 70)
            labelSuggestionHeading1.lineBreakMode = .byWordWrapping
            labelSuggestionHeading1.numberOfLines = 0
            labelSuggestionHeading1.textColor = UIColor.black
            labelSuggestionHeading1.textAlignment = .center
            let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
            CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
            let fontMain = UIFont(name: "OpenSans-Bold", size:  20.0)
            let fontSecondary = UIFont(name: "OpenSans-Bold", size:  30.0)
            
            let str1 = "We have some suggestions for you - Breakfast for tomorrow"
            
            let labelText = NSMutableAttributedString.init(string: str1)
            labelText.setAttributes([NSAttributedStringKey.font: fontMain,
                                     NSAttributedStringKey.foregroundColor: UIColor.black],
                                    range: NSMakeRange(0, str1.count))
            labelSuggestionHeading1.attributedText = labelText
            labelSuggestionHeading1.alpha = 1
            labelSuggestionHeading1.adjustsFontSizeToFitWidth = true
            
            
            let strA = "Total Calories : " +  String(getCalories())
            let strB = "Breakfast (Assumed) : 500"
            let strC = "Lunch (Assumed) : 1000"
            let strD = "Calories consumed in Dinner : " + String(getCalories() - getRemainingCalories(totalCalories : getCalories()))
            
            let finalString = strA + "\n" + strB + "\n" + strC + "\n" + strD
            
            
            //Show him label - as per your calories - we have suggestions for you.
            labelSuggestionSubHeading.removeFromSuperview()
            labelSuggestionSubHeading.frame = CGRect(x: 10, y: finalMealView.frame.height/2 - 170 , width: finaMealView.frame.size.width - 20, height: 130)
            labelSuggestionSubHeading.lineBreakMode = .byWordWrapping
            labelSuggestionSubHeading.numberOfLines = 0
            labelSuggestionSubHeading.textColor = UIColor.black
            labelSuggestionSubHeading.textAlignment = .center
            
            
            let labelTextSub = NSMutableAttributedString.init(string: finalString)
            labelTextSub.setAttributes([NSAttributedStringKey.font: fontMain,
                                        NSAttributedStringKey.foregroundColor: UIColor.gray],
                                       range: NSMakeRange(0, finalString.count))
            labelSuggestionSubHeading.attributedText = labelTextSub
            labelSuggestionSubHeading.alpha = 1
            labelSuggestionSubHeading.adjustsFontSizeToFitWidth = true
            
            
            //Show him 2 buttons now
            //Button Suggestion 1
            buttonMealSuggestion1 = UIButton(frame: CGRect(x: 0,y: finaMealView.frame.size.height / 2, width: finaMealView.frame.size.width/3,height: finaMealView.frame.size.height / 2))
            buttonMealSuggestion1.setImage(UIImage(named: "breakfast_advice_1.png"), for: .normal)
            //   buttonMealSuggestion1.addTarget(self, action: #selector(buttonMealSuggestion1Action), for: .touchUpInside)
            buttonMealSuggestion1.clipsToBounds = true
            buttonMealSuggestion1.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion1.alpha = 0
            
            //Button Suggestion 2
            buttonMealSuggestion2 = UIButton(frame: CGRect(x: finaMealView.frame.size.width/3,y: finaMealView.frame.size.height / 2, width: view.frame.size.width/3,height: finaMealView.frame.size.height / 2))
            buttonMealSuggestion2.setImage(UIImage(named: "breakfast_advice_2.png"), for: .normal)
            //  buttonMealSuggestion2.addTarget(self, action: #selector(buttonMealSuggestion2Action), for: .touchUpInside)
            buttonMealSuggestion2.clipsToBounds = true
            buttonMealSuggestion2.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion2.alpha = 0
            
            //Button Suggestion 3
            buttonMealSuggestion3 = UIButton(frame: CGRect(x: finaMealView.frame.size.width * 2 / 3,y: finaMealView.frame.size.height / 2, width: view.frame.size.width/3,height: finaMealView.frame.size.height / 2))
            buttonMealSuggestion3.setImage(UIImage(named: "breakfast_advice_3.png"), for: .normal)
            //   buttonMealSuggestion3.addTarget(self, action: #selector(buttonMealSuggestion2Action), for: .touchUpInside)
            buttonMealSuggestion3.clipsToBounds = true
            buttonMealSuggestion3.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion3.alpha = 0
            
            finalMealView.addSubview(buttonMealSuggestion1)
            finalMealView.addSubview(buttonMealSuggestion2)
            finalMealView.addSubview(buttonMealSuggestion3)
            finalMealView.addSubview(labelSuggestionSubHeading)
            finalMealView.addSubview(labelSuggestionHeading1)
            
        }
        else{
            //SHOW HIM OPTIONS FOR LUNCH AND DINNER FOR TODAY
            
            let caloriesLeftForDay = getRemainingCalories(totalCalories : getCalories())
            
            var imageOption1 = ""
            var imageOption2 = ""
            var imageOption3 = ""
            var imageOption4 = ""
            
            if caloriesLeftForDay <= 500 {
                //lunch light + lunch light more
                //dinner light _ dinner medium
                imageOption1 = "lunch_light_more.png"
                imageOption2 = "lunch_low.png"
                imageOption3 = "dinner_low.png"
                imageOption4 = "dinner_light_more.png"
                
            }
                
          else if caloriesLeftForDay <= 600 {
                //lunch light + lunch light more
                //dinner light _ dinner medium
                imageOption1 = "lunch_low.png"
                imageOption2 = "lunch_6.png"
                imageOption3 = "dinner_medium.png"
                imageOption4 = "dinner_low.png"
                
            }
            
           else if caloriesLeftForDay <= 800 {
                //lunch light + lunch light more
                //dinner light _ dinner medium
                imageOption1 = "lunch_light_more.png"
                imageOption2 = "lunch_6.png"
                imageOption3 = "dinner_low.png"
                imageOption4 = "dinner_7.png"
                
            }
            
            else if caloriesLeftForDay <= 1000 {
                //lunch light + lunch light more
                //dinner light _ dinner medium
                imageOption1 = "lunch_6.png"
                imageOption2 = "lunch_7.png"
                imageOption3 = "dinner_light_more.png"
                imageOption4 = "dinner_7.png"
                
            }
            else if caloriesLeftForDay <= 1200 {
                //show him dinner - medium and light
                // lunch medium and lunch hight
                
                imageOption1 = "lunch_7.png"
                imageOption2 = "lunch_medium.png"
                imageOption3 = "dinner_8.png"
                imageOption4 = "dinner_low.png"
            }
                
            else if caloriesLeftForDay <= 1400 {
                //show him dinner - medium and light
                // lunch medium and lunch hight
                
                imageOption1 = "lunch_8.png"
                imageOption2 = "lunch_low.png"
                imageOption3 = "dinner_6.png"
                imageOption4 = "dinner_7.png"
            }
                
            else if caloriesLeftForDay <= 1600 {
                //show him dinner - medium and light
                // lunch medium and lunch hight
                
                imageOption1 = "lunch_8.png"
                imageOption2 = "lunch_6.png"
                imageOption3 = "dinner_low.png"
                imageOption4 = "dinner_6.png"
            }
                
            else if caloriesLeftForDay <= 1800 {
                //show him dinner - medium and light
                // lunch medium and lunch hight
                
                imageOption1 = "lunch_8.png"
                imageOption2 = "lunch_light_more.png"
                imageOption3 = "dinner_7.png"
                imageOption4 = "dinner_medium.png"
            }
                
            else if caloriesLeftForDay <= 2000 {
                //show him dinner - medium and light
                // lunch medium and lunch hight
                
                imageOption1 = "lunch_low.png"
                imageOption2 = "lunch_medium.png"
                imageOption3 = "dinner_8.png"
                imageOption4 = "dinner_9.png"
            }
            else{
                //lunch medium and high
                //dinner light + medium
                imageOption1 = "lunch_medium.png"
                imageOption2 = "lunch_high.png"
                imageOption3 = "dinner_medium.png"
                imageOption4 = "dinner_high.png"
            }
            
            
            //Show him label - as per your calories - we have suggestions for you.
            labelSuggestionHeading1.removeFromSuperview()
            labelSuggestionHeading1.frame = CGRect(x: 10, y: 10 , width: finaMealView.frame.size.width - 20, height: 60)
            labelSuggestionHeading1.lineBreakMode = .byWordWrapping
            labelSuggestionHeading1.numberOfLines = 0
            labelSuggestionHeading1.textColor = UIColor.black
            labelSuggestionHeading1.textAlignment = .center
            let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
            CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
            let fontMain = UIFont(name: "OpenSans-Bold", size:  20.0)
            
            let str1 = "Based on your meal & calories, We have some suggestions for you - Lunch"
            
            let labelText = NSMutableAttributedString.init(string: str1)
            labelText.setAttributes([NSAttributedStringKey.font: fontMain,
                                     NSAttributedStringKey.foregroundColor: UIColor.black],
                                    range: NSMakeRange(0, str1.count))
            labelSuggestionHeading1.attributedText = labelText
            labelSuggestionHeading1.alpha = 1
            labelSuggestionHeading1.adjustsFontSizeToFitWidth = true
            
            
            let strA = "Total Calories : " +  String(getCalories())
            let strB = "Calories consumed in Breakfast : " + String(getCalories() - getRemainingCalories(totalCalories : getCalories()))
            
            let finalString = strA + "\n" + strB
            
            //Show him label - as per your calories - we have suggestions for you.
            labelSuggestionSubHeading.removeFromSuperview()
            labelSuggestionSubHeading.frame = CGRect(x: 10, y: 80 , width: finaMealView.frame.size.width - 20, height: 60)
            labelSuggestionSubHeading.lineBreakMode = .byWordWrapping
            labelSuggestionSubHeading.numberOfLines = 0
            labelSuggestionSubHeading.textColor = UIColor.black
            labelSuggestionSubHeading.textAlignment = .center
            
            let labelTextSub = NSMutableAttributedString.init(string: finalString)
            labelTextSub.setAttributes([NSAttributedStringKey.font: fontMain,
                                        NSAttributedStringKey.foregroundColor: UIColor.gray],
                                       range: NSMakeRange(0, finalString.count))
            labelSuggestionSubHeading.attributedText = labelTextSub
            labelSuggestionSubHeading.alpha = 1
            labelSuggestionSubHeading.adjustsFontSizeToFitWidth = true
            
            let tempHeght = (finaMealView.frame.size.height - 120) / 2
            
            //Button Suggestion 1
            buttonMealSuggestion1 = UIButton(frame: CGRect(x: finaMealView.frame.size.width/4,y: 140, width: finaMealView.frame.size.width/4,height: tempHeght - 20))
            buttonMealSuggestion1.setImage(UIImage(named: imageOption1), for: .normal)
            //    buttonMealSuggestion1.addTarget(self, action: #selector(buttonMealSuggestion1Action), for: .touchUpInside)
            buttonMealSuggestion1.clipsToBounds = true
            buttonMealSuggestion1.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion1.alpha = 0
            
            //Button Suggestion 2
            buttonMealSuggestion2 = UIButton(frame: CGRect(x: finaMealView.frame.size.width/2,y: 140, width: view.frame.size.width/4,height: tempHeght - 20))
            buttonMealSuggestion2.setImage(UIImage(named: imageOption2), for: .normal)
            //   buttonMealSuggestion2.addTarget(self, action: #selector(buttonMealSuggestion2Action), for: .touchUpInside)
            buttonMealSuggestion2.clipsToBounds = true
            buttonMealSuggestion2.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion2.alpha = 0
            
            //Suggestion for dinner tonight
            
            //Show him label - as per your calories - we have suggestions for you.
            labelSuggestionHeading2.removeFromSuperview()
            labelSuggestionHeading2.frame = CGRect(x: 10, y: buttonMealSuggestion1.frame.origin.y + tempHeght - 20 , width: finaMealView.frame.size.width - 20, height: 40)
            labelSuggestionHeading2.lineBreakMode = .byWordWrapping
            labelSuggestionHeading2.numberOfLines = 0
            labelSuggestionHeading2.textColor = UIColor.black
            labelSuggestionHeading2.textAlignment = .center
            
            labelSuggestionHeading2.numberOfLines = 0
            labelSuggestionHeading2.lineBreakMode = .byWordWrapping
            let strTemp1 = "And for Dinner"
            
            let labelTextTemp = NSMutableAttributedString.init(string: strTemp1)
            labelTextTemp.setAttributes([NSAttributedStringKey.font: fontMain,
                                         NSAttributedStringKey.foregroundColor: UIColor.black],
                                        range: NSMakeRange(0, strTemp1.count))
            labelSuggestionHeading2.attributedText = labelTextTemp
            labelSuggestionHeading2.alpha = 1
            labelSuggestionHeading2.adjustsFontSizeToFitWidth = true
            
            
            //Button Suggestion 3
            buttonMealSuggestion3 = UIButton(frame: CGRect(x: finaMealView.frame.size.width/4,y: finaMealView.frame.size.height - tempHeght + 20, width: finaMealView.frame.size.width/4,height: tempHeght - 20))
            buttonMealSuggestion3.setImage(UIImage(named: imageOption3), for: .normal)
            //   buttonMealSuggestion3.addTarget(self, action: #selector(buttonMealSuggestion1Action), for: .touchUpInside)
            buttonMealSuggestion3.clipsToBounds = true
            buttonMealSuggestion3.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion3.alpha = 0
            
            //Button Suggestion
            buttonMealSuggestion4 = UIButton(frame: CGRect(x: finaMealView.frame.size.width/2,y: finaMealView.frame.size.height - tempHeght + 20, width: view.frame.size.width/4,height: tempHeght - 20))
            buttonMealSuggestion4.setImage(UIImage(named: imageOption4), for: .normal)
            //   buttonMealSuggestion4.addTarget(self, action: #selector(buttonMealSuggestion2Action), for: .touchUpInside)
            buttonMealSuggestion4.clipsToBounds = true
            buttonMealSuggestion4.imageView?.contentMode = .scaleAspectFit
            buttonMealSuggestion4.alpha = 0
            
            finalMealView.addSubview(buttonMealSuggestion1)
            finalMealView.addSubview(buttonMealSuggestion2)
            finalMealView.addSubview(buttonMealSuggestion3)
            finalMealView.addSubview(buttonMealSuggestion4)
            finalMealView.addSubview(labelSuggestionSubHeading)
            finalMealView.addSubview(labelSuggestionHeading1)
            finalMealView.addSubview(labelSuggestionHeading2)
        }
    }
    
    public func animateMealSuggestionsButton(btn1: UIButton, btn2 : UIButton) {
        btn1.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn1.alpha = 1
        btn2.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn2.alpha = 1
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        btn1.transform = .identity
                        btn2.transform = .identity
            },
                       completion: nil)
    }
    
    public func animateMealSuggestionsBreakfastButton(btn1: UIButton, btn2 : UIButton, btn3 : UIButton ) {
        btn1.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn1.alpha = 1
        btn2.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn2.alpha = 1
        btn3.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn3.alpha = 1
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        btn1.transform = .identity
                        btn2.transform = .identity
                        btn3.transform = .identity
            },
                       completion: nil)
    }
    
    
    public func animateMealSuggestionsLunchDinnerButton(btn1: UIButton, btn2 : UIButton, btn3 : UIButton, btn4: UIButton) {
        btn1.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn1.alpha = 1
        btn2.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn2.alpha = 1
        btn3.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn3.alpha = 1
        btn4.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        btn4.alpha = 1
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        btn1.transform = .identity
                        btn2.transform = .identity
                        btn3.transform = .identity
                        btn4.transform = .identity
            },
                       completion: nil)
    }
    
    public func updateLabelRemainingCalories() {
        DispatchQueue.main.async {
            let cfURL = Bundle.main.url(forResource: "OpenSans-Bold", withExtension: "ttf") as! CFURL
            CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
            let fontMain = UIFont(name: "OpenSans-Bold", size:  20.0)
            let fontSecondary = UIFont(name: "OpenSans-Bold", size:  40.0)
            let strTemp1 = "Calories Remaining: "
            let strTemp2 = String(self.getRemainingCalories(totalCalories : self.getCalories()))
            
            let labelCaloriesRemainingText = NSMutableAttributedString.init(string: strTemp1 + strTemp2)
            labelCaloriesRemainingText.setAttributes([NSAttributedStringKey.font: fontMain,
                                                      NSAttributedStringKey.foregroundColor: UIColor.gray],
                                                     range: NSMakeRange(0, strTemp1.count - 1))
            labelCaloriesRemainingText.setAttributes([NSAttributedStringKey.font: fontSecondary,
                                                      NSAttributedStringKey.foregroundColor:  UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1)],
                                                     range: NSMakeRange(strTemp1.count,strTemp2.count))
            self.labelCaloriesRemaining.attributedText = labelCaloriesRemainingText
            
            
            
            //Means anything selected - show him the button else hide the button
            if (self.getCalories() != self.getRemainingCalories(totalCalories : self.getCalories())) {
                self.buttonDietPredictor.alpha = 1.0
                self.showDietPredictorButton()
                self.animateButton(button: self.buttonDietPredictor)
            }
            else{
                self.buttonDietPredictor.alpha = 0.0
            }
            
        }
    }
    
    public func getRemainingCalories(totalCalories : Int) -> Int {
        // 600 700 850 900 700 BREAKFAST CALORIE ARRAY
        // 1100 1200 1300 1400 1500 LUNCH CALORIE ARRAY
        // 1100 1200 1000 700 1000 DINNER CALORIE ARRAY
        let breakfastCalorieArray : NSArray = [600, 700, 850, 900, 700]
        let lunchCalorieArray : NSArray = [1100, 1200, 1300, 1400, 1500]
        let dinnerCalorieArray : NSArray = [1100, 1200, 1000, 700, 1000]
        
        var commonArray : NSArray = []
        
        if getConsumedMealName() == "Breakfast" {
            commonArray = breakfastCalorieArray
        }
        else if getConsumedMealName() == "Lunch" {
            commonArray = lunchCalorieArray
        }
        else if getConsumedMealName() == "Dinner" {
            commonArray = dinnerCalorieArray
        }
        else{
            commonArray = breakfastCalorieArray
        }
        
        if isMealType1opened {
            return totalCalories - (commonArray[0] as! Int)
        }
        
        if isMealType2opened {
            return totalCalories - (commonArray[1] as! Int)
        }
        
        if isMealType3opened {
            return totalCalories - (commonArray[2] as! Int)
        }
        
        if isMealType4opened {
            return totalCalories - (commonArray[3] as! Int)
        }
        
        if isMealType5opened {
            return totalCalories - (commonArray[4] as! Int)
        }
        
        return totalCalories
    }
    
    
    //Adding four buttons/images to resume options - to see my details
    public func addFiveButtonMealOptions(view : UIView) {
        
        buttonMealType1.removeFromSuperview()
        buttonMealType2.removeFromSuperview()
        buttonMealType3.removeFromSuperview()
        buttonMealType4.removeFromSuperview()
        buttonMealType5.removeFromSuperview()
        
        var imageType1 = ""
        var imageType2 = ""
        var imageType3 = ""
        var imageType4 = ""
        var imageType5 = ""
        
        if (getConsumedMealName() == "Breakfast") {
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        else if (getConsumedMealName() == "Lunch") {
            imageType1 = "lunch_1.png"
            imageType2 = "lunch_2.png"
            imageType3 = "lunch_3.png"
            imageType4 = "lunch_4.png"
            imageType5 = "lunch_5.png"
        }
        else if (getConsumedMealName() == "Dinner") {
            imageType1 = "dinner_1.png"
            imageType2 = "dinner_2.png"
            imageType3 = "dinner_3.png"
            imageType4 = "dinner_4.png"
            imageType5 = "dinner_5.png"
        }
        else{
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        
        //Button 1
        buttonMealType1 = UIButton(frame: CGRect(x: 0,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/5,height: 400))
        buttonMealType1.setImage(UIImage(named: imageType1), for: .normal)
        buttonMealType1.addTarget(self, action: #selector(buttonMealType1Action), for: .touchUpInside)
        buttonMealType1.clipsToBounds = true
        buttonMealType1.imageView?.contentMode = .scaleAspectFit
        buttonMealType1.alpha = 0
        
        //Button 2
        buttonMealType2 = UIButton(frame: CGRect(x: view.frame.size.width/5,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/5,height: 400))
        buttonMealType2.setImage(UIImage(named: imageType2), for: .normal)
        buttonMealType2.addTarget(self, action: #selector(buttonMealType2Action), for: .touchUpInside)
        buttonMealType2.clipsToBounds = true
        buttonMealType2.imageView?.contentMode = .scaleAspectFit
        buttonMealType2.alpha = 0
        
        //Button 3
        buttonMealType3 = UIButton(frame: CGRect(x: view.frame.size.width/2.5,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/5,height: 400))
        buttonMealType3.setImage(UIImage(named: imageType3), for: .normal)
        buttonMealType3.addTarget(self, action: #selector(buttonMealType3Action), for: .touchUpInside)
        buttonMealType3.clipsToBounds = true
        buttonMealType3.imageView?.contentMode = .scaleAspectFit
        buttonMealType3.alpha = 0
        
        //Button 4
        buttonMealType4 = UIButton(frame: CGRect(x: view.frame.size.width*3 / 5,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/5,height: 400))
        buttonMealType4.setImage(UIImage(named: imageType4), for: .normal)
        buttonMealType4.addTarget(self, action: #selector(buttonMealType4Action), for: .touchUpInside)
        buttonMealType4.clipsToBounds = true
        buttonMealType4.imageView?.contentMode = .scaleAspectFit
        buttonMealType4.alpha = 0
        
        //Button 4
        buttonMealType5 = UIButton(frame: CGRect(x: view.frame.size.width*4 / 5 ,y: view.frame.size.height / 2 - 200, width: view.frame.size.width/5,height: 400))
        buttonMealType5.setImage(UIImage(named: imageType5), for: .normal)
        buttonMealType5.addTarget(self, action: #selector(buttonMealType5Action), for: .touchUpInside)
        buttonMealType5.clipsToBounds = true
        buttonMealType5.imageView?.contentMode = .scaleAspectFit
        buttonMealType5.alpha = 0
        
        //Hiding them initially
        isMealType1opened = false
        isMealType2opened = false
        isMealType3opened = false
        isMealType4opened = false
        isMealType5opened = false
        
        //Adding to their superview
        view.addSubview(buttonMealType1)
        view.addSubview(buttonMealType2)
        view.addSubview(buttonMealType3)
        view.addSubview(buttonMealType4)
        view.addSubview(buttonMealType5)
    }
    
    //Home button action on main page
    @objc  func buttonMealType1Action(sender:UIButton!) {
        
        var imageType1 = ""
        var imageType2 = ""
        var imageType3 = ""
        var imageType4 = ""
        var imageType5 = ""
        
        if (getConsumedMealName() == "Breakfast") {
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        else if (getConsumedMealName() == "Lunch") {
            imageType1 = "lunch_1.png"
            imageType2 = "lunch_2.png"
            imageType3 = "lunch_3.png"
            imageType4 = "lunch_4.png"
            imageType5 = "lunch_5.png"
        }
        else if (getConsumedMealName() == "Dinner") {
            imageType1 = "dinner_1.png"
            imageType2 = "dinner_2.png"
            imageType3 = "dinner_3.png"
            imageType4 = "dinner_4.png"
            imageType5 = "dinner_5.png"
        }
        else{
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        
        
        //meal 2
        if isMealType2opened {
            isMealType2opened = false
            buttonMealType2.setImage(UIImage(named: imageType2), for: .normal)
            buttonMealType2.clipsToBounds = true
            buttonMealType2.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        
        //meal 3
        if isMealType3opened {
            isMealType3opened = false
            buttonMealType3.setImage(UIImage(named: imageType3), for: .normal)
            buttonMealType3.clipsToBounds = true
            buttonMealType3.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 4
        if isMealType4opened {
            isMealType4opened = false
            buttonMealType4.setImage(UIImage(named: imageType4), for: .normal)
            buttonMealType4.clipsToBounds = true
            buttonMealType4.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 5
        if isMealType5opened {
            isMealType5opened = false
            buttonMealType5.setImage(UIImage(named: imageType5), for: .normal)
            buttonMealType5.clipsToBounds = true
            buttonMealType5.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 1
        if isMealType1opened {
            isMealType1opened = false
            buttonMealType1.setImage(UIImage(named: imageType1), for: .normal)
            buttonMealType1.clipsToBounds = true
            buttonMealType1.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isMealType1opened = true
            buttonMealType1.setImage(UIImage(named: "food_back.png"), for: .normal)
            buttonMealType1.clipsToBounds = true
            buttonMealType1.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType1, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        
        updateLabelRemainingCalories()
    }
    
    //Home button action on main page
    @objc  func buttonMealType2Action(sender:UIButton!) {
        
        var imageType1 = ""
        var imageType2 = ""
        var imageType3 = ""
        var imageType4 = ""
        var imageType5 = ""
        
        if (getConsumedMealName() == "Breakfast") {
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        else if (getConsumedMealName() == "Lunch") {
            imageType1 = "lunch_1.png"
            imageType2 = "lunch_2.png"
            imageType3 = "lunch_3.png"
            imageType4 = "lunch_4.png"
            imageType5 = "lunch_5.png"
        }
        else if (getConsumedMealName() == "Dinner") {
            imageType1 = "dinner_1.png"
            imageType2 = "dinner_2.png"
            imageType3 = "dinner_3.png"
            imageType4 = "dinner_4.png"
            imageType5 = "dinner_5.png"
        }
        else{
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        
        //meal 1
        if isMealType1opened {
            isMealType1opened = false
            buttonMealType1.setImage(UIImage(named: imageType1), for: .normal)
            buttonMealType1.clipsToBounds = true
            buttonMealType1.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 3
        if isMealType3opened {
            isMealType3opened = false
            buttonMealType3.setImage(UIImage(named: imageType3), for: .normal)
            buttonMealType3.clipsToBounds = true
            buttonMealType3.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 4
        if isMealType4opened {
            isMealType4opened = false
            buttonMealType4.setImage(UIImage(named: imageType4), for: .normal)
            buttonMealType4.clipsToBounds = true
            buttonMealType4.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 5
        if isMealType5opened {
            isMealType5opened = false
            buttonMealType5.setImage(UIImage(named: imageType5), for: .normal)
            buttonMealType5.clipsToBounds = true
            buttonMealType5.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 2
        if isMealType2opened {
            isMealType2opened = false
            buttonMealType2.setImage(UIImage(named: imageType2), for: .normal)
            buttonMealType2.clipsToBounds = true
            buttonMealType2.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isMealType2opened = true
            buttonMealType2.setImage(UIImage(named: "food_back.png"), for: .normal)
            buttonMealType2.clipsToBounds = true
            buttonMealType2.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType2, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        
        updateLabelRemainingCalories()
    }
    
    //Home button action on main page
    @objc  func buttonMealType3Action(sender:UIButton!) {
        
        var imageType1 = ""
        var imageType2 = ""
        var imageType3 = ""
        var imageType4 = ""
        var imageType5 = ""
        
        if (getConsumedMealName() == "Breakfast") {
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        else if (getConsumedMealName() == "Lunch") {
            imageType1 = "lunch_1.png"
            imageType2 = "lunch_2.png"
            imageType3 = "lunch_3.png"
            imageType4 = "lunch_4.png"
            imageType5 = "lunch_5.png"
        }
        else if (getConsumedMealName() == "Dinner") {
            imageType1 = "dinner_1.png"
            imageType2 = "dinner_2.png"
            imageType3 = "dinner_3.png"
            imageType4 = "dinner_4.png"
            imageType5 = "dinner_5.png"
        }
        else{
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        
        //meal 1
        if isMealType1opened {
            isMealType1opened = false
            buttonMealType1.setImage(UIImage(named: imageType1), for: .normal)
            buttonMealType1.clipsToBounds = true
            buttonMealType1.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        
        //meal 3
        if isMealType2opened {
            isMealType2opened = false
            buttonMealType2.setImage(UIImage(named: imageType2), for: .normal)
            buttonMealType2.clipsToBounds = true
            buttonMealType2.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 4
        if isMealType4opened {
            isMealType4opened = false
            buttonMealType4.setImage(UIImage(named: imageType4), for: .normal)
            buttonMealType4.clipsToBounds = true
            buttonMealType4.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 5
        if isMealType5opened {
            isMealType5opened = false
            buttonMealType5.setImage(UIImage(named: imageType5), for: .normal)
            buttonMealType5.clipsToBounds = true
            buttonMealType5.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 2
        if isMealType3opened {
            isMealType3opened = false
            buttonMealType3.setImage(UIImage(named: imageType3), for: .normal)
            buttonMealType3.clipsToBounds = true
            buttonMealType3.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isMealType3opened = true
            buttonMealType3.setImage(UIImage(named: "food_back.png"), for: .normal)
            buttonMealType3.clipsToBounds = true
            buttonMealType3.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType3, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        
        updateLabelRemainingCalories()
    }
    
    //Home button action on main page
    @objc  func buttonMealType4Action(sender:UIButton!) {
        
        var imageType1 = ""
        var imageType2 = ""
        var imageType3 = ""
        var imageType4 = ""
        var imageType5 = ""
        
        if (getConsumedMealName() == "Breakfast") {
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        else if (getConsumedMealName() == "Lunch") {
            imageType1 = "lunch_1.png"
            imageType2 = "lunch_2.png"
            imageType3 = "lunch_3.png"
            imageType4 = "lunch_4.png"
            imageType5 = "lunch_5.png"
        }
        else if (getConsumedMealName() == "Dinner") {
            imageType1 = "dinner_1.png"
            imageType2 = "dinner_2.png"
            imageType3 = "dinner_3.png"
            imageType4 = "dinner_4.png"
            imageType5 = "dinner_5.png"
        }
        else{
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        
        //meal 1
        if isMealType1opened {
            isMealType1opened = false
            buttonMealType1.setImage(UIImage(named: imageType1), for: .normal)
            buttonMealType1.clipsToBounds = true
            buttonMealType1.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        
        //meal 3
        if isMealType2opened {
            isMealType2opened = false
            buttonMealType2.setImage(UIImage(named: imageType2), for: .normal)
            buttonMealType2.clipsToBounds = true
            buttonMealType2.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 4
        if isMealType3opened {
            isMealType3opened = false
            buttonMealType3.setImage(UIImage(named: imageType3), for: .normal)
            buttonMealType3.clipsToBounds = true
            buttonMealType3.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 5
        if isMealType5opened {
            isMealType5opened = false
            buttonMealType5.setImage(UIImage(named: imageType5), for: .normal)
            buttonMealType5.clipsToBounds = true
            buttonMealType5.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 2
        if isMealType4opened {
            isMealType4opened = false
            buttonMealType4.setImage(UIImage(named: imageType4), for: .normal)
            buttonMealType4.clipsToBounds = true
            buttonMealType4.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isMealType4opened = true
            buttonMealType4.setImage(UIImage(named: "food_back.png"), for: .normal)
            buttonMealType4.clipsToBounds = true
            buttonMealType4.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType4, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        updateLabelRemainingCalories()
    }
    
    //Home button action on main page
    @objc  func buttonMealType5Action(sender:UIButton!) {
        
        var imageType1 = ""
        var imageType2 = ""
        var imageType3 = ""
        var imageType4 = ""
        var imageType5 = ""
        
        if (getConsumedMealName() == "Breakfast") {
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        else if (getConsumedMealName() == "Lunch") {
            imageType1 = "lunch_1.png"
            imageType2 = "lunch_2.png"
            imageType3 = "lunch_3.png"
            imageType4 = "lunch_4.png"
            imageType5 = "lunch_5.png"
        }
        else if (getConsumedMealName() == "Dinner") {
            imageType1 = "dinner_1.png"
            imageType2 = "dinner_2.png"
            imageType3 = "dinner_3.png"
            imageType4 = "dinner_4.png"
            imageType5 = "dinner_5.png"
        }
        else{
            imageType1 = "breakfast_1.png"
            imageType2 = "breakfast_2.png"
            imageType3 = "breakfast_3.png"
            imageType4 = "breakfast_4.png"
            imageType5 = "breakfast_5.png"
        }
        
        //meal 1
        if isMealType1opened {
            isMealType1opened = false
            buttonMealType1.setImage(UIImage(named: imageType1), for: .normal)
            buttonMealType1.clipsToBounds = true
            buttonMealType1.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        
        //meal 3
        if isMealType2opened {
            isMealType2opened = false
            buttonMealType2.setImage(UIImage(named: imageType2), for: .normal)
            buttonMealType2.clipsToBounds = true
            buttonMealType2.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 4
        if isMealType3opened {
            isMealType3opened = false
            buttonMealType3.setImage(UIImage(named: imageType3), for: .normal)
            buttonMealType3.clipsToBounds = true
            buttonMealType3.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 5
        if isMealType4opened {
            isMealType4opened = false
            buttonMealType4.setImage(UIImage(named: imageType4), for: .normal)
            buttonMealType4.clipsToBounds = true
            buttonMealType4.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        //meal 2
        if isMealType5opened {
            isMealType5opened = false
            buttonMealType5.setImage(UIImage(named: imageType5), for: .normal)
            buttonMealType5.clipsToBounds = true
            buttonMealType5.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else{
            isMealType5opened = true
            buttonMealType5.setImage(UIImage(named: "food_back.png"), for: .normal)
            buttonMealType5.clipsToBounds = true
            buttonMealType5.imageView?.contentMode = .scaleAspectFit
            UIView.transition(with: buttonMealType5, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        
        updateLabelRemainingCalories()
    }
    
    //Animating
    public func animateFiveButtonsMealOptionsOnce() {
        buttonMealType1.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonMealType1.alpha = 1
        buttonMealType2.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonMealType2.alpha = 1
        buttonMealType3.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonMealType3.alpha = 1
        buttonMealType4.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonMealType4.alpha = 1
        buttonMealType5.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        buttonMealType5.alpha = 1
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.buttonMealType1.transform = .identity
                        self?.buttonMealType2.transform = .identity
                        self?.buttonMealType3.transform = .identity
                        self?.buttonMealType4.transform = .identity
                        self?.buttonMealType5.transform = .identity
                        
            },
                       completion: nil)
    }
    
    public func getCurrentHour() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        return hour
    }
    
    public func getConsumedMealName() -> String {
    
        //what did you have in breakfast
        if getCurrentHour() >= 1 && getCurrentHour() < 12 {
            return "Breakfast"
        }
            //what did you have in lunch
        else if getCurrentHour() >= 12 && getCurrentHour() <= 18 {
            return "Lunch"
        }
            //What did you have in dinner
        else {
            return "Dinner"
        }
    }
    
    public func animateiCalorieButton(btn: UIButton, delay: TimeInterval, animationDuration : TimeInterval, springVelocity : CGFloat, springDamping : CGFloat) {
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
    
    func getCalories() -> Int{
        //male selected
        if isMaleSelected == true {
            
            if isBelow20Selected == true {
                return maleCalorieArray[0] as! Int
            }
            
            if is2130Selected == true {
                return maleCalorieArray[1] as! Int
            }
            
            if is3140Selected == true {
                return maleCalorieArray[2] as! Int
            }
            
            if isAbove40Selected == true {
                return maleCalorieArray[3] as! Int
            }
        }
            //Female selected
        else{
            if isBelow20Selected == true {
                return femaleCalorieArray[0] as! Int
            }
            
            if is2130Selected == true {
                return femaleCalorieArray[1] as! Int
            }
            
            if is3140Selected == true {
                return femaleCalorieArray[2] as! Int
            }
            
            if isAbove40Selected == true {
                return femaleCalorieArray[3] as! Int
            }
        }
        return 2400
    }
}
/* ----------- INTEREST ANIMATION CODE ---------------- */
extension LiveViewiPadViewController {
    
    func makeInterestAnimation() {
        
        if self.interestEmitterLayer != nil {
            return
        }
        
        let ps4Image = UIImage(named: "ps4")!
        let foodImage = UIImage(named: "chicken")!
        let iPhoneImage = UIImage(named: "iphone")!
        let carImage = UIImage(named: "car")!
        let watchImage = UIImage(named: "watch")!
        let interestEmitterLayer = CAEmitterLayer()
        interestEmitterLayer.emitterSize = self.view.frame.size
        interestEmitterLayer.emitterPosition = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        let ps4 = makeInterestAnimationEmitterCell(ps4Image)
        let chicken = makeInterestAnimationEmitterCell(foodImage)
        let iphone = makeInterestAnimationEmitterCell(iPhoneImage)
        let car = makeInterestAnimationEmitterCell(carImage)
        let watch = makeInterestAnimationEmitterCell(watchImage)
        
        interestEmitterLayer.emitterCells = [ps4, chicken, iphone, car, watch]
        interestEmitterLayer.birthRate = 2
        interestEmitterLayer.speed = 0.2
        self.view.layer.insertSublayer(interestEmitterLayer, below: self.view.layer)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            interestEmitterLayer.birthRate = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.interestEmitterLayer?.removeFromSuperlayer()
                self.interestEmitterLayer = nil
            }
        }
    }
    
    public func makeInterestAnimationEmitterCell(_ image: UIImage) -> CAEmitterCell {
        // Create Emitter Cell
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.minificationFilter = kCAFilterLinear
        cell.scale = 0.01
        cell.scaleRange = 0.2
        cell.scaleSpeed = -0.50
        cell.birthRate = 5
        cell.lifetime = 12
        cell.lifetimeRange = 4
        cell.velocity = 300
        cell.velocityRange = 60
        cell.alphaRange = 0.5
        cell.alphaSpeed = -0.1
        cell.spin = .pi * 1
        cell.spinRange = .pi / 2
        cell.emissionLongitude = (.pi * 0)
        cell.emissionRange = 360
        cell.speed = 2
        
        return cell
    }
}

/* ----------------- Fish Animation Code --------------*/

//FISH ANIMATION
extension LiveViewiPadViewController {
    public func setupFishScene() {
        fishImageView = UIImageView(frame: CGRect(x: -220, y: self.view.center.y - 100, width: 200, height: 200))
        fishImageView?.image = UIImage(named: "fish")
        if let aView = fishImageView {
            isFishStopped = false
            self.view.addSubview(aView)
        }
        fishTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.createBubble), userInfo: nil, repeats: true)
        goFishGo()
    }
    func goFishGo() {
        UIView.animate(withDuration: 7, animations: {() -> Void in
            self.fishImageView?.frame = CGRect(x: self.view.frame.size.width + 200, y: self.view.center.y - 100, width: 200, height: 200)
        }, completion: {(_ finished: Bool) -> Void in
            self.fishImageView?.frame = CGRect(x: self.view.frame.origin.x - 200, y: self.view.center.y - 100, width: 200, height: 200)
            if self.isFishStopped == false {
                self.goFishGo()
            }
            else{
                if self.fishTimer != nil {
                    self.fishTimer?.invalidate()
                }
            }
        })
    }
    
    public func clearFishScene() {
        isFishStopped = true
        fishImageView?.removeFromSuperview()
        if fishTimer != nil {
            fishTimer?.invalidate()
        }
    }
    
    func randomFloatBetween(_ smallNumber: Float, and bigNumber: Float) -> Float {
        let diff: Float = bigNumber - smallNumber
        return ((Float(arc4random() % (UInt32(RAND_MAX) + 1)) / Float(RAND_MAX)) * diff) + smallNumber
    }
    
    @objc func createBubble() {
        let bubbleImageView = UIImageView(image: UIImage(named: "bubble_fish"))
        let size: CGFloat = CGFloat(randomFloatBetween(5, and: 30))
        bubbleImageView.frame = CGRect(x: (fishImageView?.layer.presentation()?.frame.origin.x)! + 5, y: (fishImageView?.layer.presentation()?.frame.origin.y)! + 80, width: size, height: size)
        bubbleImageView.alpha = CGFloat(randomFloatBetween(0.1, and: 1))
        view.addSubview(bubbleImageView)
        let zigzagPath = UIBezierPath()
        let oX: CGFloat = bubbleImageView.frame.origin.x
        let oY: CGFloat = bubbleImageView.frame.origin.y
        let eX: CGFloat = oX
        let eY: CGFloat = oY - CGFloat(randomFloatBetween(50, and: 300))
        let t: CGFloat = CGFloat(randomFloatBetween(20, and: 100))
        var cp1 = CGPoint(x: oX - t, y: (oY + eY) / 2)
        var cp2 = CGPoint(x: oX + t, y: cp1.y)
        let r: Int = Int(arc4random() % 2)
        if r == 1 {
            let temp: CGPoint = cp1
            cp1 = cp2
            cp2 = temp
        }
        zigzagPath.move(to: CGPoint(x: oX, y: oY))
        zigzagPath.addCurve(to: CGPoint(x: eX, y: eY), controlPoint1: cp1, controlPoint2: cp2)
        CATransaction.begin()
        CATransaction.setCompletionBlock({() -> Void in
            UIView.transition(with: bubbleImageView, duration: 0.1, options: .transitionCrossDissolve, animations: {() -> Void in
                bubbleImageView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }, completion: {(_ finished: Bool) -> Void in
                bubbleImageView.removeFromSuperview()
            })
        })
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.duration = 2
        pathAnimation.path = zigzagPath.cgPath
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        bubbleImageView.layer.add(pathAnimation, forKey: "movingAnimation")
        CATransaction.commit()
    }
}


/* ----------------- Confetti Animation Code --------------*/

//CONFETTI ANIMATION
extension LiveViewiPadViewController {
    public func makeConfettiAnimation() {
        if self.particleEmitter != nil {
            return
        }
        
        let particleEmitter = CAEmitterLayer()
        let confettiImage = UIImage(named: "diamond")!
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: 0)
        particleEmitter.emitterShape = kCAEmitterLayerLine
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        particleEmitter.beginTime = CACurrentMediaTime()
        let confetti = makeConfettiEmitterCell(confettiImage)
        particleEmitter.emitterCells = [confetti]
        view.layer.addSublayer(particleEmitter)
        self.particleEmitter = particleEmitter
        let motionEffects = self.view.motionEffects
        self.view.motionEffects = []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            particleEmitter.birthRate = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                particleEmitter.removeFromSuperlayer()
                self.particleEmitter = nil
                self.view.motionEffects = motionEffects
            }
        }
    }
    
    private func makeConfettiEmitterCell(_ image: UIImage) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.birthRate = 150
        emitterCell.lifetime = 5
        emitterCell.color = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        emitterCell.blueRange = 0.8
        emitterCell.scaleRange = 0.2
        emitterCell.spinRange = 10
        emitterCell.emissionLongitude = CGFloat.pi
        emitterCell.emissionRange = CGFloat.pi / 4
        emitterCell.velocity = 250
        emitterCell.velocityRange = 75
        emitterCell.yAcceleration = 150
        emitterCell.scale = 0.5
        emitterCell.redRange = 0.8
        emitterCell.greenRange = 0.8
        emitterCell.contents = image.cgImage
        return emitterCell
    }
}


/* ----------------- Firework Animation Code --------------*/

//FIREWORKS ANIMATION
extension LiveViewiPadViewController {
    func makeFireworkAnimation() {
        if self.particleEmitter != nil {
            return
        }
        
        let particleEmitter = CAEmitterLayer()
        let particleImage = UIImage(named: "firework")!
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: view.frame.size.height - 20)
        particleEmitter.renderMode = kCAEmitterLayerAdditive
        particleEmitter.beginTime = CACurrentMediaTime()
        let firework = makeFireworkEmitterCell(particleImage)
        particleEmitter.emitterCells = [firework]
        view.layer.addSublayer(particleEmitter)
        self.particleEmitter = particleEmitter
        let motionEffects = self.view.motionEffects
        self.view.motionEffects = []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            particleEmitter.birthRate = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                particleEmitter.removeFromSuperlayer()
                self.particleEmitter = nil
                self.view.motionEffects = motionEffects
            }
        }
    }
    
    private func makeFireworkEmitterCell(_ image: UIImage) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.emissionLatitude = 0
        cell.greenRange = 0.9
        cell.blueRange = 0.9
        cell.emissionLongitude = 3 * CGFloat.pi / 2.0
        cell.velocityRange = 100
        cell.yAcceleration = 150
        cell.birthRate = 6
        cell.velocity = view.frame.size.height * 2 / 3
        cell.color = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        cell.redRange = 0.9
        cell.emissionRange = CGFloat.pi / 4
        cell.lifetime = 3
        let flareCell = makeFireworkFlareCell(image)
        let fireworkCell = makeFireworkFireworkCell(image)
        cell.emitterCells = [flareCell, fireworkCell]
        
        return cell
    }
    
    private func makeFireworkFlareCell(_ image: UIImage) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = image.cgImage
        emitterCell.emissionLongitude = CGFloat.pi * 2
        emitterCell.lifetime = 0.5
        emitterCell.scaleSpeed = -0.1
        emitterCell.scaleRange = 0.1
        emitterCell.yAcceleration = -150
        emitterCell.velocity = 80
        emitterCell.birthRate = 45
        emitterCell.scale = 0.4
        emitterCell.beginTime = 0.01
        emitterCell.duration = 1.7
        emitterCell.emissionRange = CGFloat.pi / 7.0
        emitterCell.alphaSpeed = -0.7
        return emitterCell
    }
    
    private func makeFireworkFireworkCell(_ image: UIImage) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = image.cgImage
        emitterCell.birthRate = 19999
        emitterCell.beginTime = 1.5
        emitterCell.duration = 0.1
        emitterCell.lifetime = 100
        emitterCell.alphaSpeed = -0.2
        emitterCell.scale = 0.6
        emitterCell.velocity = 130
        emitterCell.emissionRange = CGFloat.pi * 2
        emitterCell.scaleSpeed = -0.1
        emitterCell.spin = 2
        emitterCell.yAcceleration = 80
        return emitterCell
    }
}

/* ----------------- Bubble Animation Code --------------*/

//BUBBLE ANIMATION
extension LiveViewiPadViewController {
    func makeBubbleAnimation() {
        if self.particleEmitter != nil {
            return
        }
        
        let particleEmitter = CAEmitterLayer()
        let bubbleImage = UIImage(named: "Bubble")!
        particleEmitter.emitterShape = kCAEmitterLayerLine
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: view.frame.size.height + bubbleImage.size.height / 2)
        particleEmitter.beginTime = CACurrentMediaTime()
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        let bubble = makeBubbleEmitterCell(bubbleImage)
        particleEmitter.emitterCells = [bubble]
        view.layer.addSublayer(particleEmitter)
        self.particleEmitter = particleEmitter
        let motionEffects = self.view.motionEffects
        self.view.motionEffects = []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            particleEmitter.birthRate = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                particleEmitter.removeFromSuperlayer()
                self.view.motionEffects = motionEffects
                self.particleEmitter = nil
            }
        }
    }
    
    private func makeBubbleEmitterCell(_ image: UIImage) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.birthRate = 6
        emitterCell.velocity = 200
        emitterCell.lifetime = 7.0
        emitterCell.emissionLongitude = 0
        emitterCell.emissionRange = CGFloat.pi / 4
        emitterCell.spinRange = 0.5
        emitterCell.scaleSpeed = -0.05
        emitterCell.spin = 0
        emitterCell.velocityRange = 50
        emitterCell.scale = 0.5
        emitterCell.lifetimeRange = 0
        emitterCell.scaleRange = 0.5
        emitterCell.contents = image.cgImage
        return emitterCell
    }
}

/* ----------------- Drawing View Code --------------*/

//line class to describe about a line
class Line {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    var lineWidth: CGFloat
    
    init(start: CGPoint, end: CGPoint, color: UIColor!, lineWidth: CGFloat) {
        self.start = start
        self.end = end
        self.color = color
        self.lineWidth = lineWidth
    }
}

//make a draw view for paint app
class DrawView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var drawColor = UIColor.black
    var lineWidth: CGFloat = 5
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = (touches.first as AnyObject).location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newPoint = (touches.first as AnyObject).location(in: self)
        lines.append(Line(start: lastPoint, end: newPoint, color: drawColor, lineWidth: lineWidth))
        lastPoint = newPoint
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        context?.setLineWidth(lineWidth)
        context?.setLineCap(.round)
        
        for line in lines {
            context!.setLineWidth(line.lineWidth)
            context?.move(to: CGPoint(x: line.start.x, y: line.start.y))
            context?.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
            context?.setStrokeColor(line.color.cgColor)
            context?.strokePath()
        }
    }
}

//to pop in drawing view with animation
extension UIView {
    public func popInView(fromScale: CGFloat = 0.5,
                          duration: TimeInterval = 0.5,
                          delay: TimeInterval = 0,
                          completion: ((Bool) -> Void)? = nil) -> UIView {
        isHidden = false
        alpha = 0
        transform = CGAffineTransform(scaleX: fromScale, y: fromScale)
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.transform = .identity
                self.alpha = 1
        }, completion: completion)
        return self
    }
    
    func bounceIn(x: CGFloat = 0,
                  y: CGFloat = 0,
                  duration: TimeInterval = 0.5,
                  delay: TimeInterval = 0,
                  completion: ((Bool) -> Void)? = nil) -> UIView {
        let offset = CGPoint(x: -frame.maxX, y: 0)
        transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        isHidden = false
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: 0.58, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.transform = .identity
                self.alpha = 1
        }, completion: completion)
        return self
    }
    
    func bounceOut(x: CGFloat = 0,
                   y: CGFloat = 0,
                   duration: TimeInterval = 0.35,
                   delay: TimeInterval = 0,
                   completion: ((Bool) -> Void)? = nil) -> UIView {
        let offset = CGPoint(x: (self.superview?.frame.size.width)! - frame.minX, y: 0)
        let delta = CGPoint(x: offset.x + x, y: offset.y + y)
        let endTransform = CGAffineTransform(translationX: delta.x, y: delta.y)
        let prepareTransform = CGAffineTransform(translationX: -delta.x * 0.2, y: -delta.y * 0.2)
        UIView.animateKeyframes(
            withDuration: duration, delay: delay, options: .calculationModeCubic, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
                    self.transform = prepareTransform
                }
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2) {
                    self.transform = prepareTransform
                }
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) {
                    self.transform = endTransform
                }
        }, completion: completion)
        return self
    }
}


/* ----------------- CollectionView Cell --------------*/

//CollectionView Cell to display icons on the main page
class CustomCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect(x: (frame.size.width)/4, y: (frame.size.height)/4, width: (frame.size.width)/2, height: (frame.size.width)/2))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20.0
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        label = UILabel(frame: CGRect(x: 0, y: (frame.size.height)/4 + frame.size.width/2 + 5, width: frame.size.width, height: 20))
        label.textAlignment = .center
        label.textColor = UIColor.white
        let fontMain = UIFont(name: "HelveticaNeue", size:  15.0)
        label.font = fontMain
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        self.backgroundColor =  UIColor(red: 0.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1).cgColor
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
    
    func setPulseRadius(radius: CGFloat) {
        self.radius = radius
        let tempPos = self.position
        let diameter = self.radius * 2
        self.bounds = CGRect(x: 0.0, y: 0.0, width: diameter, height: diameter)
        self.cornerRadius = self.radius
        self.position = tempPos
    }

    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = self.animationDuration
        opacityAnimation.values = [self.fromValueForAlpha, 0.8, 0]
        opacityAnimation.keyTimes = [0, self.keyTimeForHalfOpacity as NSNumber, 1]
        opacityAnimation.isRemovedOnCompletion = false
        
        return opacityAnimation
    }
    
    func createScaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: self.fromValueForRadius)
        scaleAnimation.toValue = NSNumber(value: 1.0)
        scaleAnimation.duration = self.animationDuration
        
        return scaleAnimation
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = LiveViewiPadViewController()
PlaygroundPage.current.needsIndefiniteExecution = true


