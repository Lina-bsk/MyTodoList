
import SwiftUI

struct EmptyView: View {
    
    @State private var animate = false
    
    var body: some View {
        
        VStack(spacing: 25) {
            Text("There are no items")
                .font(.title)
                .fontWeight(.semibold)
            Text("Start by adding a few tasks to get your to-do list rolling!")
           
            NavigationLink {
                AddView()
            } label: {
                Text("Add new")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(animate ? Color.blue : Color.mint)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.horizontal, animate ? 30 : 40)
            .shadow(color: animate ? Color.blue.opacity(0.5) : Color.mint.opacity(0.5),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 40 : 20
            )
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .padding()
        
        .onAppear(perform: {
            addAnimation()
        })
    }
    
    func addAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation( Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        })
    }
}

#Preview {
    EmptyView()
}
