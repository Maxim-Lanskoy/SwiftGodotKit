SwiftGodotKit provides a way of embedding Godot into an existing Swift
application and driving Godot from Swift, without having to use an
extension.   This is a companion to [SwiftGodot](https://github.com/migueldeicaza/SwiftGodot), which
provides the API binding to the Godot API.

# New SwiftGodotKit

This branch contains the new embeddable system that is better suited
to be embedded into an existing iOS and Mac app, and allows either a
full game to be displayed, or individual parts in an app.  This is
based on the 4.4-based `libgodot` patches that turn Godot into an
embeddable library.

If you are looking for the old version that only ran on macOS, check
out the `legacy` branch.

## Using this

Just reference this module from your Package.swift file or from Xcode.

## Sample

A simple SwiftUI API is provided.

In the example below, in an existing iOS project type using SwiftUI,
add a Godot PCK file to your project, and then call it like this:

```swift
import SwiftUI
import SwiftGodot
import SwiftGodotKit

struct ContentView: View {
    @State var app = GodotApp(packFile: "game.pck")

    var body: some View {
        VStack {
            Text("Game is below:")
            GodotAppView()
                .padding()
        }
	.environment(\.godotApp, app)
    }
}
```

There can only be one GodotApp in your application, but you can reference different scenes from it.

# Discussions

You can join our [Discussions on GitHub](https://github.com/migueldeicaza/SwiftGodot/discussions) or the #swiftgodotkit
channel on the [Swift on Godot Slack server](https://join.slack.com/t/swiftongodot/shared_invite/zt-2aqygohvb-stSRGEAN~c3awuMwtaqCAA).
