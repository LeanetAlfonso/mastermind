import Foundation
import SwiftUI

// Game difficulty
struct Difficulty: Hashable{
    var maxAttempts: Int
    var codeSize: Int
    var numColors: Int
    var difficulty: String
    var color: Color
}
