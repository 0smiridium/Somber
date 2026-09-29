#import <AppKit/AppKit.h>
#import "Sombre+Button.h"

static void DrawRoundedRect(NSRect rect, CGFloat radius, NSColor *fillColor,
                            NSColor *borderColor, CGFloat lineWidth)
{
  NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect: rect
                                                        xRadius: radius
                                                        yRadius: radius];
  [fillColor setFill];
  [path fill];

  [borderColor setStroke];
  [path setLineWidth: lineWidth];
  [path stroke];
}

static void DrawShadow(NSRect rect, CGFloat radius, CGFloat blur)
{
  NSShadow *shadow = [[NSShadow alloc] init];
  [shadow setShadowOffset: NSMakeSize(0, -2)];
  [shadow setShadowBlurRadius: blur];
  [shadow setShadowColor: [NSColor colorWithCalibratedWhite: 0 alpha: 0.15]];
  [shadow set];
  [shadow release];
}

@implementation Sombre(Button)

- (void) drawButton: (NSRect) frame
                in: (NSCell*) cell
              view: (NSView*) view
             style: (int) style
            state: (GSThemeControlState) state
{
  NSColor *fillColor = [self buttonColorInCell: cell forState: state];
  NSColor *accentColor = [NSColor colorWithCalibratedRed: 0.502 green: 0.306 blue: 1.0 alpha: 1.0]; /* #8050FF - Updated accent */
  NSColor *borderColor;
  CGFloat cornerRadius = 8.0; /* Modern larger radius */
  CGFloat lineWidth = 0.5;
  
  /* Determine border color based on state */
  if (state == GSThemeHighlightedState || state == GSThemeSelectedState ||
      state == GSThemeHighlightedFirstResponderState || state == GSThemeSelectedFirstResponderState)
    {
      borderColor = accentColor;
      lineWidth = 1.5; /* Thicker border for active state */
    }
  else
    {
      borderColor = [fillColor shadowWithLevel: 0.3];
    }
  
  /* Draw subtle shadow for depth */
  if (state != GSThemeDisabledState)
    {
      DrawShadow(NSInsetRect(frame, 1, 1), cornerRadius, 3.0);
    }
  
  /* Draw flat rounded button with modern styling */
  DrawRoundedRect(NSInsetRect(frame, 0.5, 0.5), cornerRadius, fillColor, borderColor, lineWidth);
}

- (NSColor*) buttonColorInCell: (NSCell*) cell
                       forState: (GSThemeControlState) state
{
  NSColor *accentColor = [NSColor colorWithCalibratedRed: 0.502 green: 0.306 blue: 1.0 alpha: 1.0];
  
  if (state == GSThemeHighlightedFirstResponderState ||
      state == GSThemeSelectedFirstResponderState)
    {
      /* Modern accent color for primary interaction */
      return accentColor;
    }

  if (state == GSThemeHighlightedState ||
      state == GSThemeSelectedState)
    {
      /* Lighter accent for secondary interaction */
      return [accentColor blendedColorWithFraction: 0.3 ofColor: [NSColor controlBackgroundColor]];
    }

  if (state == GSThemeDisabledState)
    {
      /* Subtle disabled state */
      return [[NSColor controlColor] blendedColorWithFraction: 0.3
                                                   ofColor: [NSColor controlBackgroundColor]];
    }

  /* Default button color - slightly elevated surface */
  return [[NSColor controlBackgroundColor] blendedColorWithFraction: 0.05
                                                         ofColor: [NSColor whiteColor]];
}

- (void) drawPathButton: (NSBezierPath*) path
                    in: (NSCell*) cell
                 state: (GSThemeControlState) state
{
  NSColor *backgroundColor = [self buttonColorInCell: cell forState: state];
  NSColor *accentColor = [NSColor colorWithCalibratedRed: 0.502 green: 0.306 blue: 1.0 alpha: 1.0];
  NSColor *borderColor;
  CGFloat lineWidth = 0.5;
  
  if (state == GSThemeHighlightedState || state == GSThemeSelectedState ||
      state == GSThemeHighlightedFirstResponderState || state == GSThemeSelectedFirstResponderState)
    {
      borderColor = accentColor;
      lineWidth = 1.5;
    }
  else
    {
      borderColor = [backgroundColor shadowWithLevel: 0.3];
    }

  [backgroundColor setFill];
  [path fill];
  [borderColor setStroke];
  [path setLineWidth: lineWidth];
  [path stroke];
}

@end
