import SwiftUI

struct ColorButtonView: View {
    
    @Binding var fill: Color
    @Binding var stroke: Color
    @Binding var content: String
    @Binding var selected: Bool
    
    @State private var wave = true
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(fill)
            if (selected){
                Circle()
                    .strokeBorder(stroke, lineWidth: 2)
                    .padding(.all, 0.0)
                    .scaleEffect(wave && (fill != Color.clear) ? 1.25 : 1)
                    .opacity(wave ? 1 : 0.3)
                    .onAppear(){
                        self.wave.toggle()
                        withAnimation(
                            .easeInOut(duration: 1)
                                        .repeatForever(autoreverses: true)
                                        .speed(1.5)) {
                            self.wave.toggle()
                        }
                    }
            }
            else {
                Circle()
                    .strokeBorder(stroke, lineWidth: 2)
                    .padding(.all, 0.0)
            }
            Text(content)
        }
        .frame(width: 28, height: 28)
        .foregroundColor(Color(red: 0.0, green: 0.2, blue: 0.2))
    }
}

struct ColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ColorButtonView(fill: Binding.constant(.purple),
                        stroke: Binding.constant(.blue),
                        content: Binding.constant("Hi"),
                        selected: Binding.constant(true))
    }
}