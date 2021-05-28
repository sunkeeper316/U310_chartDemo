
import UIKit

class CustomChartViewController: UIViewController {
    
    
    @IBOutlet weak var chartView: PostureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        chartView.setDashedLine()
        var posturePointList = [PosturePoint]()
        
        posturePointList.append(PosturePoint(bmi: 16, bodyfat: 10))
        posturePointList.append(PosturePoint(bmi: 17, bodyfat: 19))
        posturePointList.append(PosturePoint(bmi: 19, bodyfat: 25))
        
        chartView.addDot(posturePointList: posturePointList , gender: 1)
    }
    
    func setDashedLine( cview:UIView){
        let y : CGFloat = 0
        
        let linepath = UIBezierPath()
        let lineLayer = CAShapeLayer()
        linepath.move(to: CGPoint(x: 0, y: y))
        linepath.addLine(to: CGPoint(x: cview.bounds.width, y: y))
        
        lineLayer.path = linepath.cgPath
        lineLayer.fillColor = nil
        lineLayer.lineWidth = 3
        lineLayer.strokeColor = UIColor.red.cgColor
        lineLayer.lineDashPattern = [3,3]
        cview.layer.addSublayer(lineLayer)
    }
    
    
}
