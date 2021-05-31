
import UIKit
import Foundation

class PostureView : UIView {
    
    var stringArray = ["運動員" ,"過重肌肉型" ,"肥胖" ,"低脂肪結實型" ,"標準型" ,"脂肪偏高" ,"低脂肪體重輕" ,"標準型體重輕" ,"潛在肥胖型"]
    
    var gender = 0 //0 == 女 1 == 男
    
    //BMI 10 ~ 55   標準18.5 ~ 25
    //體脂肪 3%~60%  標準 男 12 ~ 20 女 18 ~ 28
    
    var posturePointList = [PosturePoint]()
    var dotLayers = [CAShapeLayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        setDashedLine()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //        setDashedLine()
    }
    
    override func layoutSubviews() {
        setDashedLine(cgStart: CGPoint(x: 0, y: self.frame.height / 3)
                      , cgEnd: CGPoint(x: self.frame.width , y: self.frame.height / 3)
                      ,color: UIColor.grayColor)
        setDashedLine(cgStart: CGPoint(x: 0, y: self.frame.height * 2 / 3)
                      , cgEnd: CGPoint(x: self.frame.width , y: self.frame.height * 2 / 3)
                      ,color: UIColor.grayColor)
        setDashedLine(cgStart: CGPoint(x: self.frame.width / 3, y: 0)
                      , cgEnd: CGPoint(x: self.frame.width / 3, y: self.frame.height)
                      ,color: UIColor.grayColor)
        setDashedLine(cgStart: CGPoint(x: self.frame.width  * 2 / 3, y: 0)
                      , cgEnd: CGPoint(x: self.frame.width  * 2 / 3, y: self.frame.height)
                      ,color: UIColor.grayColor)
        setLine(cgStart: CGPoint(x: self.frame.width  , y: 0)
                , cgEnd: CGPoint(x: self.frame.width  , y: self.frame.height)
                ,color: UIColor.grayColor)
        setLine(cgStart: CGPoint(x: 0  , y: 0)
                , cgEnd: CGPoint(x: self.frame.width  , y: 0)
                ,color: UIColor.grayColor)
        setLine(cgStart: CGPoint(x: 0  , y: self.frame.height)
                , cgEnd: CGPoint(x: self.frame.width / 3 , y: self.frame.height)
                ,color: UIColor.blueColor)
        setLine(cgStart: CGPoint(x: 0  , y: self.frame.height * 2 / 3)
                , cgEnd: CGPoint(x: 0 , y: self.frame.height )
                ,color: UIColor.blueColor)
        setLine(cgStart: CGPoint(x: self.frame.width * 2 / 3  , y: self.frame.height )
                , cgEnd: CGPoint(x: self.frame.width / 3 , y: self.frame.height)
                ,color: UIColor.greenColor)
        setLine(cgStart: CGPoint(x: 0  , y: self.frame.height * 2 / 3)
                , cgEnd: CGPoint(x: 0 , y: self.frame.height / 3 )
                ,color: UIColor.greenColor)
        setLine(cgStart: CGPoint(x: self.frame.width * 2 / 3  , y: self.frame.height )
                , cgEnd: CGPoint(x: self.frame.width  , y: self.frame.height)
                ,color: UIColor.orangeColor)
        setLine(cgStart: CGPoint(x: 0  , y: self.frame.height  / 3)
                , cgEnd: CGPoint(x: 0 , y: 0  )
                ,color: UIColor.orangeColor)
        addArrow(start: CGPoint(x: self.frame.width  , y: self.frame.height), end: CGPoint(x: self.frame.width + 20  , y: self.frame.height), pointerLineLength: 10, arrowAngle: CGFloat(Double.pi / 4), color: UIColor.grayColor)
        addArrow(start: CGPoint(x: 0  , y: 0), end: CGPoint(x: 0  , y: 0 - 20), pointerLineLength: 10, arrowAngle: CGFloat(Double.pi / 4), color: UIColor.grayColor)
        addLabel()
        
    }
    
    func addDot(posturePointList : [PosturePoint] , gender : Int){
        self.gender = gender
        removeAllDot()
        let width = self.frame.width / 3
        let height = self.frame.height / 3
        for (index , posturePoint) in posturePointList.enumerated() {
            var x : CGFloat = 0
            var y : CGFloat = 0
            var bodyfat = posturePoint.bodyfat
            var bmi = posturePoint.bmi
            if bmi < 10 {
                bmi = 10
            }else if bmi > 55 {
                bmi = 55
            }
            if bodyfat < 3 {
                bodyfat = 3
            }else if bodyfat > 60 {
                bodyfat = 60
            }
            if bmi < 18.5 {
                bmi = bmi - 10
                let r = (8.5 - bmi) / 8.5
                y = height * CGFloat(r) + height * 2
            }else if bmi < 25 {
                bmi = bmi - 18.5
                let r = (6.5 - bmi) / 6.5
                y = height * CGFloat(r) + height
            }else{
                bmi = bmi - 25
                let r = (30 - bmi) / 30
                y = height * CGFloat(r)
            }
            
            if gender == 0 {
                if bodyfat < 18 {
                    bodyfat = bodyfat - 3
                    let r = bodyfat / 15
                    x = width * CGFloat(r)
                }else if bodyfat < 28 {
                    bodyfat = bodyfat - 18
                    let r = bodyfat / 10
                    x = width * CGFloat(r) + width
                }else{
                    bodyfat = bodyfat - 28
                    let r = bodyfat / 32
                    x = width * CGFloat(r) + width * 2
                }
            }else{
                if bodyfat < 12 {
                    bodyfat = bodyfat - 3
                    let r = bodyfat / 9
                    x = width * CGFloat(r)
                }else if bodyfat < 20 {
                    bodyfat = bodyfat - 12
                    let r = bodyfat / 8
                    x = width * CGFloat(r) + width
                }else{
                    bodyfat = bodyfat - 20
                    let r = bodyfat / 40
                    x = width * CGFloat(r) + width * 2
                }
            }
            
            
            let dotpath = UIBezierPath(ovalIn: CGRect(x: x, y: y - 10 , width: 10, height:10 ))
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotpath.cgPath
            
            if (index == posturePointList.count - 1) {
                dotLayer.fillColor = UIColor.red.cgColor
            }else{
                let alpha : CGFloat = CGFloat(1 / CGFloat(posturePointList.count))
                print(alpha)
                dotLayer.fillColor = UIColor.grayColor
                    .withAlphaComponent(alpha * CGFloat(index + 1)).cgColor
            }
            dotLayers.append(dotLayer)
            self.layer.addSublayer(dotLayer)
            
        }
    }
    func removeAllDot(){
        for layer in dotLayers {
            layer.removeFromSuperlayer()
        }
        dotLayers.removeAll()
    }
    
    func setDashedLine( cgStart :CGPoint , cgEnd :CGPoint , color :UIColor){ //畫曲線
        let linepath = UIBezierPath()
        let lineLayer = CAShapeLayer()
        linepath.move(to: cgStart)
        linepath.addLine(to: cgEnd)
        
        lineLayer.path = linepath.cgPath
        lineLayer.fillColor = nil
        lineLayer.lineWidth = 3
        lineLayer.strokeColor = color.cgColor
        lineLayer.lineDashPattern = [3,3]
        
        self.layer.addSublayer(lineLayer)
    }
    func setLine( cgStart :CGPoint , cgEnd :CGPoint , color :UIColor){ //畫直線
        let linepath = UIBezierPath()
        let lineLayer = CAShapeLayer()
        linepath.move(to: cgStart)
        linepath.addLine(to: cgEnd)
        
        lineLayer.path = linepath.cgPath
        lineLayer.fillColor = nil
        lineLayer.lineWidth = 3
        lineLayer.strokeColor = color.cgColor
        
        self.layer.addSublayer(lineLayer)
    }
    func addArrow(start: CGPoint, end: CGPoint, pointerLineLength: CGFloat, arrowAngle: CGFloat , color :UIColor) {
        let linepath = UIBezierPath()
        let lineLayer = CAShapeLayer()
        linepath.move(to: start)
        linepath.addLine(to: end)
        
        let startEndAngle = atan((end.y - start.y) / (end.x - start.x)) + ((end.x - start.x) < 0 ? CGFloat(Double.pi) : 0)
        let arrowLine1 = CGPoint(x: end.x + pointerLineLength * cos(CGFloat(Double.pi) - startEndAngle + arrowAngle), y: end.y - pointerLineLength * sin(CGFloat(Double.pi) - startEndAngle + arrowAngle))
        let arrowLine2 = CGPoint(x: end.x + pointerLineLength * cos(CGFloat(Double.pi) - startEndAngle - arrowAngle), y: end.y - pointerLineLength * sin(CGFloat(Double.pi) - startEndAngle - arrowAngle))
        
        linepath.addLine(to: arrowLine1)
        linepath.move(to: end)
        linepath.addLine(to: arrowLine2)
        
        lineLayer.path = linepath.cgPath
        lineLayer.fillColor = nil
        lineLayer.lineWidth = 3
        lineLayer.strokeColor = color.cgColor
        
        self.layer.addSublayer(lineLayer)
    }
    
    func addLabel(){
        
        for (index , str) in stringArray.enumerated() {
            let i = index % 3
            let j = index / 3
            let width = self.frame.width / 3
            let height = self.frame.height / 3
            let label = UILabel(frame: CGRect(x: width * CGFloat(i), y: height * CGFloat(j), width: width, height: height))
            label.textColor = UIColor.grayColor
            label.text = str
            label.textAlignment = .center
            label.font = UIFont(name: label.font.fontName, size: 12)
            self.addSubview(label)
            
        }
        
    }
    
    
}
class PosturePoint : NSObject {
    var bmi : Double = 0
    var bodyfat : Double = 0
    init(bmi : Double , bodyfat : Double){
        self.bmi = bmi
        self.bodyfat = bodyfat
    }
}
//print(self.frame.origin.x)
//print(self.frame.origin.y)
//print(self.frame.size.width)
//print(self.frame.size.height)
//print(self.frame.width)
//print(self.frame.maxX)
//print(self.frame.midX)
//print(self.frame.midX)
