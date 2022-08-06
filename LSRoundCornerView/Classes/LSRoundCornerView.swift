
import Foundation

@IBDesignable
open class LSRoundCornerView: UIView {
    
    public var corners: UIRectCorner = .allCorners
    
    @IBInspectable
    public var radius: CGFloat = 10 { didSet {setNeedsDisplay();setNeedsLayout()}}
    @IBInspectable
    public var drawColor: UIColor = .white {didSet {setNeedsDisplay();setNeedsLayout()}}
    @IBInspectable
    public var isHaveShadow: Bool = true {didSet {setNeedsDisplay();setNeedsLayout()}}
    @IBInspectable
    public var shadowColor: UIColor = UIColor.init(white: 0.8, alpha: 0.4) {didSet {setNeedsDisplay();setNeedsLayout()}}
    @IBInspectable
    public var shadowRadius: CGFloat = 3 {didSet {setNeedsDisplay();setNeedsLayout()}}

    open override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else{return}
        // 设置绘制颜色
        context.setFillColor(drawColor.cgColor)
        let path = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize.init(width: radius, height: radius))
        context.addPath(path.cgPath)
        context.closePath()
        context.fillPath()
        
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        
        setNeedsDisplay()
        if isHaveShadow {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOpacity = 0.5
            layer.shadowRadius = shadowRadius
            layer.shadowOffset = CGSize.init(width: 2, height: 2)
            let bezierPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize.init(width: radius, height: radius))
            layer.shadowPath = bezierPath.cgPath
        }
 
    }
    
}
