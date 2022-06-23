import SwiftUI

struct ImageBackgroundView: View {
    @State var animate: Bool = false
    let animation: Animation = Animation.linear(duration: 20.0).repeatForever(autoreverses: false)
    
    var body: some View {
        
        GeometryReader { geo in
            HStack(spacing: -1) {
                Image("darkBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                
                Image("darkBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, alignment: .leading)
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: animate ? .trailing : .leading)
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(animation) {
                animate.toggle()
            }
        }
    }
}

struct ImageBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ImageBackgroundView()
    }
}

