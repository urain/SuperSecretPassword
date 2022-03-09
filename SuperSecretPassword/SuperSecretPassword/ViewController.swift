import UIKit

class ViewController: UIViewController {

    var passwordLevel = 0
    @IBOutlet var lblStatus: UILabel!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var showHidePass: UISwitch!
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var levelTitle: UILabel!
    @IBOutlet weak var youWin: UILabel!
    @IBOutlet weak var secretPassLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passField.isHidden = true
        currentImage.isHidden = true
        levelTitle.isHidden = true
        youWin.isHidden = true
        secretPassLabel.isHidden = true
    }

    
    @IBAction func checkPass(_ sender: Any) {
        
        var correct = 0
        
        if(passwordLevel == 0){
            if(passField.text!.contains("blippi")){
                correct = 1
            }
        }
        else if(passwordLevel == 1){
            if(passField.text!.contains("peppa")){
                correct = 1
            }
        }
        else if(passwordLevel == 2){
            if(passField.text!.contains("turtle")){
                correct = 1
            }
        }
        else if(passwordLevel == 3){
            if(passField.text!.contains("anna")){
                correct = 1
            }
        }
        else if(passwordLevel == 4){
            if(passField.text!.contains("hissy")){
                correct = 1
            }
        }
        else if(passwordLevel == 5){
            var finalPassword = "THE FINAL PASSWORD IS ' sailfish ' ...SHHH....DON\'T TELL ANYONE!\n";
            if(passField.text!.contains("sailfish")){
                correct = 1
            }
        }
        
        if (correct == 1){

            let alert = UIAlertController(title: "", message: "GOOD JOB!", preferredStyle: .alert)
            let imageView = UIImageView(frame: CGRect(x: 0, y: -220, width: 270, height: 200))
            imageView.image = UIImage(named:"party.jpg")
            imageView.layer.cornerRadius = 10.0
            imageView.clipsToBounds = true
            alert.view.addSubview(imageView)
            
            self.present(alert, animated: true, completion: nil)
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
            passwordLevel += 1
            passField.text = ""
            showHidePass.isOn = false
            showHidePass.isHidden = false
            passField.isHidden = true
            currentImage.isHidden = true
            levelTitle.isHidden = true
            secretPassLabel.isHidden = true
            view.endEditing(true)
        }
        
        if(passwordLevel == 6){
            currentImage.image = UIImage(named:"candy.jpg")
            currentImage.isHidden = false
            showHidePass.isHidden = true
            secretPassLabel.isHidden = true
            youWin.isHidden = false
            view.endEditing(true)
        }

    }

    
    @IBAction func showHidePassPress(_ sender: Any) {
        if(passField.isHidden){
            passField.isHidden = false
            currentImage.isHidden = false
            levelTitle.isHidden = false
            secretPassLabel.isHidden = false
        }
        else{
            passField.isHidden = true
            currentImage.isHidden = true
            levelTitle.isHidden = true
            secretPassLabel.isHidden = true
        }
        
        // Pick what picture for the current level
        if(passwordLevel == 0){
            currentImage.image = UIImage(named:"blippi.jpg")
        }
        else if(passwordLevel == 1){
            currentImage.image = UIImage(named:"peppa.png")
        }
        else if(passwordLevel == 2){
            currentImage.image = UIImage(named:"elmo.jpg")
        }
        else if(passwordLevel == 3){
            currentImage.image = UIImage(named:"elsa_ana_olaf.jpg")
        }
        else if(passwordLevel == 4){
            currentImage.image = UIImage(named:"bingo.png")
        }
        else if(passwordLevel == 5){
            currentImage.image = UIImage(named:"i_spy.jpg")
        }
        
        levelTitle.text = "LEVEL: " + String(passwordLevel + 1)
    }
}

