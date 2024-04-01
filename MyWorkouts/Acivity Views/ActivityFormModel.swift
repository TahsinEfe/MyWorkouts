
import SwiftUI

@Observable
class ActivityFormModel {
    var name = ""
    var icon: ActivitySymbol = .mixedCardio
    var hexColor: Color = .red
    
    var activity: Activity?
    
    var updating: Bool { activity != nil }
    
    init() {}
    
    init(activity: Activity) {
        self.activity = activity
        self.name = activity.name
        self.icon = ActivitySymbol(rawValue: activity.icon) ?? .mixedCardio
        self.hexColor = Color(hex: activity.hexColor)!
    }
    
    var disabled: Bool {
        name.isEmpty
    }
}
