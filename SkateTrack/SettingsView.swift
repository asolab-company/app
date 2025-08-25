import SwiftUI

struct SettingsView: View {
    
    @Binding var currentView: String
    
    @State private var frame_top: CGFloat = 50
    @State private var frame_top_text: CGFloat = 20
    var body: some View {
        ZStack(alignment: .topLeading) { 
            
            LinearGradient(
                gradient: Gradient(colors: [Color(hexCode: "1f1f1f"), Color(hexCode: "1f1f1f")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea() 
            
            
            Image("MainBg")
                .resizable()
                .scaledToFill() 
                .ignoresSafeArea() 
            
            VStack() {
                Spacer()
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                         LinearGradient(
                             gradient: Gradient(colors: [
                                 Color(hexCode: "F16B00").opacity(0.6),  
                                 Color(hexCode: "4A4A4A").opacity(0.6),  
                                 Color(hexCode: "000000").opacity(0.6)   
                             ]),
                             startPoint: .topTrailing,
                             endPoint: .bottomLeading
                         )
                     )
                    .frame(height: 480)
                    .padding(.horizontal, 10)
                    .overlay(
                        VStack(spacing: 35) {
                            Button(action: {
                                openLink(AppLinks.STATEMENT)
                            }) {
                                SettingsButtonView(
                                    text: "STATEMENT",
                                    gradientColors: [Color(hexCode: "F79734"), Color(hexCode: "F16B00")],
                                    borderGradientColors: [Color(hexCode: "8B2D1F"), Color(hexCode: "B43A28")]
                                )
                            }
                            .frame(maxWidth: .infinity) 
                            .padding(.horizontal, 20) 

                            Button(action: {
                                rateApp()
                            }) {
                                SettingsButtonView(
                                    text: "RATE THIS APP",
                                    gradientColors: [Color(hexCode: "F79734"), Color(hexCode: "F16B00")],
                                    borderGradientColors: [Color(hexCode: "8B2D1F"), Color(hexCode: "B43A28")]
                                )
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)

                            Button(action: {
                                shareApp()
                            }) {
                                SettingsButtonView(
                                    text: "SHARE THIS APP",
                                    gradientColors: [Color(hexCode: "F79734"), Color(hexCode: "F16B00")],
                                    borderGradientColors: [Color(hexCode: "8B2D1F"), Color(hexCode: "B43A28")]
                                )
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)

                            Button(action: {
                                openLink(AppLinks.POLICY)
                            }) {
                                SettingsButtonView(
                                    text: "PRIVACY POLICY",
                                    gradientColors: [Color(hexCode: "F79734"), Color(hexCode: "F16B00")],
                                    borderGradientColors: [Color(hexCode: "8B2D1F"), Color(hexCode: "B43A28")]
                                )
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)

                            Button(action: {
                                openLink(AppLinks.TERMS)
                            }) {
                                SettingsButtonView(
                                    text: "TERMS OF USE",
                                    gradientColors: [Color(hexCode: "F79734"), Color(hexCode: "F16B00")],
                                    borderGradientColors: [Color(hexCode: "8B2D1F"), Color(hexCode: "B43A28")]
                                )
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                        }
                        .padding() 
                    )
                Spacer()
            }
            .padding()
            .onAppear {
          checkScreenAspectRatio()
            }
            
            Button(action: {
                           currentView = "Home"
                       }) {
                           Image("back_btn")
                               .resizable()
                               .frame(width: 45, height: 45)
                               .padding(8)
                               .clipShape(Circle())
                               .shadow(radius: 5)
                       }
                       .padding(.top, frame_top)
                       .padding(.leading, 20)
            
            
            ZStack {
                Text("SETTINGS")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(.white)  
            }
            .padding(.top, frame_top_text)
                       .position(x: UIScreen.main.bounds.width / 2, y: 70)
            
        }
    }
    
    private func checkScreenAspectRatio() {
        let screenSize = UIScreen.main.bounds.size
        let height = screenSize.height

        // Проверяем конкретное значение высоты экрана
        if height == 667 {
            frame_top = 80
            frame_top_text = 80

        } else {
            frame_top = 50
            frame_top_text = 20

        }
    }
}




struct SettingsButtonView: View {
    let text: String
    let gradientColors: [Color]
    let borderGradientColors: [Color]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 80)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: borderGradientColors),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 5
                )
                .frame(height: 45)
            
            RoundedRectangle(cornerRadius: 80)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: gradientColors),
                        startPoint: .bottom,
                                        endPoint: .top
                    )
                )
                .frame(height: 45)
            
            Text(text)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.4), radius: 2, x: 1, y: 1)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 10)
        }
        .shadow(radius: 2)
    }
}


func openLink(_ urlString: String) {
    if let url = URL(string: urlString) {
        UIApplication.shared.open(url)
    }
}

func rateApp() {
    if let url = URL(string: "itms-apps://itunes.apple.com/app/id"+AppLinks.APP_ID+"?action=write-review") {
        UIApplication.shared.open(url)
    }
}

func shareApp() {
    
    let appLink = "https://apps.apple.com/app/id\(AppLinks.APP_ID)"
    
    
    let items = ["Check out this awesome app to track your skateboarding rides and progress! Let’s skate toward new goals!", appLink]
    
    
    let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
    
    
    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let rootViewController = scene.windows.first?.rootViewController {
        rootViewController.present(activityVC, animated: true, completion: nil)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            SettingsView(currentView: .constant("Settings"))
                .previewDevice("iPhone 12 mini")
                .previewDisplayName("iPhone 12 mini (5.4\")")
            
            
            SettingsView(currentView: .constant("Settings"))
                .previewDevice("iPhone 14")
                .previewDisplayName("iPhone 14 (6.1\")")
            
            
            SettingsView(currentView: .constant("Settings"))
                .previewDevice("iPhone 14 Pro")
                .previewDisplayName("iPhone 14 Pro (6.1\")")
            
            
            SettingsView(currentView: .constant("Settings"))
                .previewDevice("iPhone 14 Plus")
                .previewDisplayName("iPhone 14 Plus (6.7\")")
            
            
            SettingsView(currentView: .constant("Settings"))
                .previewDevice("iPhone 14 Pro Max")
                .previewDisplayName("iPhone 14 Pro Max (6.7\")")
        }
    }
}
