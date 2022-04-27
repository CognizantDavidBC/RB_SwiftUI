import SwiftUI

extension Color {
    func inBetweenColor(_ color: Color, percentage: Double) -> Color {
        let percentage: Double = max(min(percentage, 100), 0) / 100
        switch percentage {
        case 0: return self
        case 1: return color
        default:
            var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            guard UIColor(self).getRed(&r1, green: &g1, blue: &b1, alpha: &a1) else { return self }
            guard UIColor(color).getRed(&r2, green: &g2, blue: &b2, alpha: &a2) else { return self }
            
            return Color(red: Double(r1 + (r2 - r1) * percentage),
                         green: Double(g1 + (g2 - g1) * percentage),
                         blue: Double(b1 + (b2 - b1) * percentage),
                         opacity: Double(a1 + (a2 - a1) * percentage))
        }
    }
}
