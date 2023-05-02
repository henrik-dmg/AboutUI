import SwiftUI

struct AboutHeaderView: View {
    
    let appName: String
    let subtitle: LocalizedStringKey?
    let appIcon: Image
    
    @ScaledMetric(relativeTo: .headline)
    private var imageWidth = 66
    
    var body: some View {
        HStack(alignment: .center) {
            appIcon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: imageWidth, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: imageWidth / 5, style: .continuous))
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: 4,
                    x: 0,
                    y: 4
                )
                .padding(.vertical, 4)
            VStack(alignment: .leading, spacing: 4) {
                Text(appName).font(.headline)
                    .foregroundColor(.primary)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text(currentVersionString())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private func currentVersionString() -> LocalizedStringKey {
        "Version \(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String)"
    }
    
}

struct SettingsAboutHeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            List {
                Section {
                    AboutHeaderView(appName: "URLy", subtitle: "Crafted with love in Berlin", appIcon: Image(systemName: "heart"))
                }
            }.navigationTitle("About")
        }
    }
    
}
