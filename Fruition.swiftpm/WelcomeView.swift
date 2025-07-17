import SwiftUI

struct WelcomeView: View {
    @State private var showMainApp = false
    
    var body: some View {
        if showMainApp {
            MainTabsView() // Replace with your main tab/root view
        } else {
            GeometryReader { geometry in
                ZStack {
                    // MARK: - Background Image
                    Image("welcome-background") // Replace with your image in Assets
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .ignoresSafeArea()
                    
                    // MARK: - Gradient Overlay
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.6), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .ignoresSafeArea()
                    
                    // MARK: - Foreground Content
                    VStack(spacing: 24) {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Welcome Alex!")
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            
                            Text("Be You.\nBe True")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Share some background on your goals and interests to help customize your membership experience with recommendations and content.")
                                .foregroundColor(.white.opacity(0.85))
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            HStack(spacing: 6) {
                                Image(systemName: "clock")
                                    .foregroundColor(.white)
                                    .imageScale(.small)
                                Text("Total time: less than 1 minute")
                                    .foregroundColor(.white.opacity(0.9))
                                    .font(.footnote)
                            }
                            
                            Text("We value your privacy. Please see our ")
                                .foregroundColor(.gray)
                                .font(.footnote)
                            + Text("Privacy Policy")
                                .underline()
                                .foregroundColor(.gray)
                                .font(.footnote)
                            + Text(" for details on how we use your personal information.")
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                        
                        VStack(spacing: 14) {
                            Button(action: {
                                showMainApp = true
                            }) {
                                Text("Let’s go")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .cornerRadius(12)
                            }
                            
                            Button(action: {
                                showMainApp = true
                            }) {
                                Text("Skip for now")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Spacer().frame(height: 40)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 24)
                }
            }
        }
    }
}
