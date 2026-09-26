#import <AppKit/AppKit.h>
#import "Sombre+Button.h"

static void DrawRoundedRect(NSRect rect, CGFloat radius, NSColor *fillColor,
                            NSColor *borderColor)
{
  NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect: rect
                                                        xRadius: radius
                                                        yRadius: radius];
  [fillColor setFill];
  [path fill];

  [borderColor setStroke];
  [path setLineWidth: 1.0];
  [path stroke];
}

@implementation Sombre(Button)

- (void) drawButton: (NSRect) frame
                in: (NSCell*) cell
              view: (NSView*) view
             style: (int) style
             state: (GSThemeControlState) state
{
  NSColor *fillColor = [self buttonColorInCell: cell forState: state];
  NSColor *accent = [NSColor colorWithCalibratedRed:0.486 green:0.302 blue:1.0 alpha:1.0]; /* #7C4DFF */
  NSColor *borderColor = (state == GSThemeHighlightedState || state == GSThemeSelectedState ||
                          state == GSThemeHighlightedFirstResponderState || state == GSThemeSelectedFirstResponderState)
                          ? accent
                          : [fillColor shadowWithLevel: 0.25];

  /* Flat rounded controls; larger radius for a modern feel */
  DrawRoundedRect(NSInsetRect(frame, 0.5, 0.5), 6.0,
                  fillColor, borderColor);
}

- (NSColor*) buttonColorInCell: (NSCell*) cell
                       forState: (GSThemeControlState) state
{
  if (state == GSThemeHighlightedFirstResponderState ||
      state == GSThemeSelectedFirstResponderState)
    return [NSColor alternateSelectedControlColor];

  if (state == GSThemeHighlightedState ||
      state == GSThemeSelectedState)
    return [NSColor selectedControlColor];

  if (state == GSThemeDisabledState)
    return [[NSColor controlColor] blendedColorWithFraction: 0.45
                                                   ofColor: [NSColor controlBackgroundColor]];

  return [NSColor controlBackgroundColor];
}

- (void) drawPathButton: (NSBezierPath*) path
                    in: (NSCell*) cell
                 state: (GSThemeControlState) state
{
  NSColor *backgroundColor = [self buttonColorInCell: cell forState: state];
  NSColor *accent = [NSColor colorWithCalibratedRed:0.486 green:0.302 blue:1.0 alpha:1.0];
  NSColor *borderColor = (state == GSThemeHighlightedState || state == GSThemeSelectedState)
                          ? accent
                          : [backgroundColor shadowWithLevel: 0.25];

  [backgroundColor setFill];
  [path fill];
  [borderColor setStroke];
  [path setLineWidth: 1.0];
  [path stroke];
}

@end
