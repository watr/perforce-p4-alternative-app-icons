import Foundation
import ImageIO
import CoreGraphics
import UniformTypeIdentifiers

let input = URL(fileURLWithPath: CommandLine.arguments[1])
let output = URL(fileURLWithPath: CommandLine.arguments[2])
guard let source = CGImageSourceCreateWithURL(input as CFURL, nil),
      let icon = CGImageSourceCreateImageAtIndex(source, 0, nil),
      let canvas = CGContext(
          data: nil, width: 1024, height: 1024,
          bitsPerComponent: 8, bytesPerRow: 0,
          space: CGColorSpace(name: CGColorSpace.sRGB)!,
          bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
      ) else {
    fatalError("Could not load or draw \(input.path)")
}

// Match the body and faint outer shadow of the system icons at display size.
canvas.clear(CGRect(x: 0, y: 0, width: 1024, height: 1024))
canvas.interpolationQuality = .high
canvas.setShadow(
    offset: CGSize(width: 0, height: -3),
    blur: 36,
    color: CGColor(gray: 0, alpha: 0.30)
)
canvas.draw(icon, in: CGRect(x: 102, y: 102, width: 820, height: 820))

guard let image = canvas.makeImage(),
      let destination = CGImageDestinationCreateWithURL(
          output as CFURL, UTType.png.identifier as CFString, 1, nil
      ) else {
    fatalError("Could not prepare \(output.path)")
}
CGImageDestinationAddImage(destination, image, nil)
guard CGImageDestinationFinalize(destination) else {
    fatalError("Could not write \(output.path)")
}
