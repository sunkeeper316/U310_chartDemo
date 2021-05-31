
import UIKit

class CustomChartViewController: UIViewController {
    
    @IBOutlet weak var tfBMI: UITextField!
    @IBOutlet weak var tfBodyFat: UITextField!
    @IBOutlet weak var tfResult: UILabel!
    
    @IBOutlet weak var chartView: PostureView!
    
    var posturePointList = [PosturePoint]()
    
    var gender = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        chartView.setDashedLine()
//        var posturePointList = [PosturePoint]()
//
//        posturePointList.append(PosturePoint(bmi: 16, bodyfat: 10))
//        posturePointList.append(PosturePoint(bmi: 17, bodyfat: 19))
//        posturePointList.append(PosturePoint(bmi: 19, bodyfat: 25))
//
//
    }
    //當點擊view任何喔一處鍵盤收起
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func clickAdd(_ sender: UIButton) {
        let bmi = Double(tfBMI.text!)
        let bodyfat = Double(tfBodyFat.text!)
        if let bmi = bmi , let bodyfat = bodyfat {
            let posturePoint = PosturePoint( bmi: bmi, bodyfat: bodyfat)
            posturePointList.append(posturePoint)
            
            chartView.addDot(posturePointList: posturePointList , gender: gender)
            var show = ""
            for (index , p) in posturePointList.enumerated() {
                show += "\(index): (\(p.bmi),\(p.bodyfat)) "
            }
            tfResult.text! = show
        }
        
    }
    
    @IBAction func clickSegmented(_ sender: UISegmentedControl) {
        gender = sender.selectedSegmentIndex
    }
    
    
    @IBAction func clickClear(_ sender: UIButton) {
        chartView.removeAllDot()
        posturePointList.removeAll()
        tfResult.text = ""
    }
    
}
