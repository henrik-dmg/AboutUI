import SwiftUI
import SafariServices

struct AdaptiveLink<Content: View>: View {
    
    let content: Content
    let destination: URL
    let useContextMenu: Bool
    
    @Binding var openLinksInApp: Bool
    @State private var isPresentingSafariView = false
    
    init?<S: StringProtocol>(_ title: S, destination: URL?, useContextMenu: Bool = true, openLinksInApp: Binding<Bool>) where Content == Text {
        self.init(destination: destination, useContextMenu: useContextMenu, openLinksInApp: openLinksInApp, content: { Text(title) })
    }
    
    init?(destination: URL?, useContextMenu: Bool = true, openLinksInApp: Binding<Bool>, @ViewBuilder content: () -> Content) {
        guard let destination = destination else {
            return nil
        }
        self.content = content()
        self.destination = destination
        self.useContextMenu = useContextMenu
        self._openLinksInApp = openLinksInApp
    }
    
    var body: some View {
#if os(iOS)
        if useContextMenu {
            link.contextMenu {
                Link(destination: destination) {
                    Label("Open in Safari", systemImage: "safari")
                }
                Button(action: { isPresentingSafariView = true }, label: {
                    Label("Open in-app", systemImage: "network")
                })
            }
        } else {
            link
        }
#else
        Link(destination: destination) { content }
#endif
    }
    
#if os(iOS)
    @ViewBuilder
    private var link: some View {
        if openLinksInApp {
            Button {
                isPresentingSafariView = true
            } label: {
                content
            }.sheet(isPresented: $isPresentingSafariView) {
                WrappedViewController(viewController: SFSafariViewController(url: destination))
                    .ignoresSafeArea(.container, edges: .bottom)
            }
        } else {
            Link(destination: destination) {
                content
                    .sheet(isPresented: $isPresentingSafariView) {
                        WrappedViewController(viewController: SFSafariViewController(url: destination))
                            .ignoresSafeArea(.container, edges: .bottom)
                    }
            }
        }
    }
#endif
    
}

#if os(iOS)
struct WrappedViewController<UIViewControllerType: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: UIViewControllerType
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
#endif
