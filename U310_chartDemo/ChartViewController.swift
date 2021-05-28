
import Charts
import UIKit

class ChartViewController: UIViewController {
    
    @IBOutlet weak var chartView: BubbleChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Bubble Chart"
        //        self.options = [.toggleValues,
        //                        .toggleIcons,
        //                        .toggleHighlight,
        //                        .animateX,
        //                        .animateY,
        //                        .animateXY,
        //                        .saveToGallery,
        //                        .togglePinchZoom,
        //                        .toggleAutoScaleMinMax,
        //                        .toggleData]
        
        chartView.chartDescription?.enabled = false
        
        chartView.delegate = self
        
        chartView.dragEnabled = false
        chartView.setScaleEnabled(true)
        chartView.maxVisibleCount = 200
        chartView.pinchZoomEnabled = true
        
        chartView.legend.horizontalAlignment = .left
        chartView.legend.form = .none
        chartView.legend.verticalAlignment = .top
        chartView.legend.orientation = .vertical
        chartView.legend.drawInside = false
//        chartView.legend.font = UIFont(name: "HelveticaNeue-Light", size: 10)!
        
        chartView.leftAxis.drawLabelsEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawZeroLineEnabled = false
        chartView.leftAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.leftAxis.spaceTop = 0.3
        chartView.leftAxis.spaceBottom = 0.3
        chartView.leftAxis.axisMinimum = 0
        chartView.leftAxis.enabled = false
        
        chartView.rightAxis.enabled = false
        chartView.rightAxis.drawLabelsEnabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawZeroLineEnabled = false
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.xAxis.drawAxisLineEnabled = true
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.enabled = false
        
        
        setDataCount(10 , range: 20)
        
    }
    func setDataCount(_ count: Int, range: UInt32) {
        let yVals1 = (0..<count).map { (i) -> BubbleChartDataEntry in
            let val = Double(arc4random_uniform(range))
            //                let size = CGFloat(arc4random_uniform(range))
            return BubbleChartDataEntry(x: Double(i), y: val, size: CGFloat(0.5))
        }
        
        var sets = [BubbleChartDataSet]()
        for (index,y) in yVals1.enumerated() {
            let set = BubbleChartDataSet(entries: [y], label: "")
            
            set.normalizeSizeEnabled = false
            set.setColor(ChartColorTemplates.colorful()[0], alpha: CGFloat(index) / 10)
            set.drawValuesEnabled = false
            set.valueColors = [.clear]
            sets.append(set)
        }
        
        
        let data = BubbleChartData(dataSets: sets)
        
        data.setDrawValues(false)
//        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 2)!)
        data.setHighlightCircleWidth(1.5)
        data.setValueTextColor(.white)
        
        chartView.data = data
    }
    
}

extension ChartViewController : ChartViewDelegate {
    
    
}


//            let set2 = BubbleChartDataSet(entries: yVals2, label: "DS 2")
//            set2.drawIconsEnabled = false
//            set2.iconsOffset = CGPoint(x: 0, y: 15)
//            set2.setColor(ChartColorTemplates.colorful()[1], alpha: 0.5)
//            set2.drawValuesEnabled = true
//
//            let set3 = BubbleChartDataSet(entries: yVals3, label: "DS 3")
//            set3.setColor(ChartColorTemplates.colorful()[2], alpha: 0.5)
//            set3.drawValuesEnabled = true


//            let yVals2 = (0..<count).map { (i) -> BubbleChartDataEntry in
//                let val = Double(arc4random_uniform(range))
//                let size = CGFloat(arc4random_uniform(range))
//                return BubbleChartDataEntry(x: Double(i), y: val, size: size, icon: UIImage(named: "icon"))
//            }
//            let yVals3 = (0..<count).map { (i) -> BubbleChartDataEntry in
//                let val = Double(arc4random_uniform(range))
//                let size = CGFloat(arc4random_uniform(range))
//                return BubbleChartDataEntry(x: Double(i), y: val, size: size)
//            }
