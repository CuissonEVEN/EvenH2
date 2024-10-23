//
//  TempViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/23/24.
//

import UIKit

class TempViewController: UIViewController {
    @IBOutlet weak var memberButton: UIButton!
    @IBOutlet weak var memDetailButton: UIButton!
    @IBOutlet weak var introductionButton: UIButton!
    @IBOutlet weak var goalButton: UIButton!
    @IBOutlet weak var promiseButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func geMember(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Member", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MemberViewController") as! MemberViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func goMemDetail(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MemberDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MemberDetailViewController") as! MemberDetailViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func goIntroduction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Introduction", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "IntroductionViewController") as! IntroductionViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func goGoal(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Goal", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GoalViewController") as! GoalViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func goPromise(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Promise", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PromiseViewController") as! PromiseViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func goMain(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        navigationController?.pushViewController(viewController, animated: true)
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
