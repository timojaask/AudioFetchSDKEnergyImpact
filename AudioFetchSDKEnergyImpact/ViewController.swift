import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func initSdk_tapped(_ sender: Any) {
        let _ = AudioManager.shared
    }

}

