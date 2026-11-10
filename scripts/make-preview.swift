import AppKit

// Compose the actual exported icons; no separate approximation of the artwork.
let width = 1200
let height = 480
let canvas = NSBitmapImageRep(
    bitmapDataPlanes: nil, pixelsWide: width, pixelsHigh: height,
    bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true,
    isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0
)!
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: canvas)
NSColor(calibratedWhite: 0.96, alpha: 1).setFill()
NSRect(x: 0, y: 0, width: width, height: height).fill()

for (index, name) in ["P4V", "P4Merge", "P4Admin"].enumerated() {
    guard let icon = NSImage(contentsOfFile: "icons/\(name).png") else {
        fatalError("Missing exported icon: \(name)")
    }
    let x = CGFloat(index * 400 + 56)
    icon.draw(in: NSRect(x: x, y: 130, width: 288, height: 288))
    let style = NSMutableParagraphStyle()
    style.alignment = .center
    let label = NSAttributedString(string: name, attributes: [
        .font: NSFont.systemFont(ofSize: 28, weight: .semibold),
        .foregroundColor: NSColor(calibratedWhite: 0.15, alpha: 1),
        .paragraphStyle: style
    ])
    label.draw(in: NSRect(x: CGFloat(index * 400), y: 64, width: 400, height: 40))
}
NSGraphicsContext.restoreGraphicsState()
try canvas.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: "assets/preview.png"))
