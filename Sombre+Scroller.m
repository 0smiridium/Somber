#include "Sombre.h"
#include "SombreScrollerKnobCell.h"
#include "SombreScrollerKnobSlotCell.h"
#include "SombreScrollerArrowCell.h"

@interface Sombre(SombreScroller)
@end

@implementation Sombre(SombreScroller)

/* Modern minimalist scrollbars - thin, refined, with purple accent on interaction */
- (NSButtonCell*) cellForScrollerArrow: (NSScrollerArrow) arrow
                            horizontal: (BOOL) horizontal
{
  SombreScrollerArrowCell *cell = [SombreScrollerArrowCell new];
  NSString *name;

  [cell setBezelStyle: NSRoundedBezelStyle];
  [cell setHighlightsBy: NSChangeBackgroundCellMask | NSContentsCellMask];
  [cell setImagePosition: NSImageOnly];

  if (horizontal)
    {
      if (arrow == NSScrollerDecrementArrow)
        {
          [cell setImage: [NSImage imageNamed: @"common_ArrowLeft"]];
          [cell setArrowType: SombreScrollerArrowLeft];
          name = GSScrollerLeftArrow;
        }
      else
        {
          [cell setImage: [NSImage imageNamed: @"common_ArrowRight"]];
          [cell setArrowType: SombreScrollerArrowRight];
          name = GSScrollerRightArrow;
        }
    }
  else if (arrow == NSScrollerDecrementArrow)
    {
      [cell setImage: [NSImage imageNamed: @"common_ArrowUp"]];
      [cell setArrowType: SombreScrollerArrowUp];
      name = GSScrollerUpArrow;
    }
  else
    {
      [cell setImage: [NSImage imageNamed: @"common_ArrowDown"]];
      [cell setArrowType: SombreScrollerArrowDown];
      name = GSScrollerDownArrow;
    }

  [self setName: name forElement: cell temporary: YES];
  RELEASE(cell);
  return cell;
}

- (NSCell*) cellForScrollerKnob: (BOOL) horizontal
{
  SombreScrollerKnobCell *cell = [SombreScrollerKnobCell new];
  [cell setButtonType: NSMomentaryChangeButton];
  [cell setBezelStyle: NSRoundedBezelStyle];
  [cell setImagePosition: NSImageOnly];
  [cell setTitle: @""];

  [self setName: (horizontal ? GSScrollerHorizontalKnob : GSScrollerVerticalKnob)
      forElement: cell
       temporary: YES];
  RELEASE(cell);
  return cell;
}

- (NSCell*) cellForScrollerKnobSlot: (BOOL) horizontal
{
  SombreScrollerKnobSlotCell *cell = [SombreScrollerKnobSlotCell new];
  NSString *name = horizontal ? GSScrollerHorizontalSlot : GSScrollerVerticalSlot;
  NSColor *color = [self colorNamed: name state: GSThemeNormalState];

  [cell setBordered: NO];
  [cell setTitle: nil];
  [cell setHorizontal: horizontal];
  [self setName: name forElement: cell temporary: YES];

  /* Modern dark slot background - nearly invisible until interacted */
  [cell setBackgroundColor: color ?: [NSColor colorWithCalibratedWhite: 0.09 alpha: 0.8]];

  RELEASE(cell);
  return cell;
}

- (float) defaultScrollerWidth
{
  return 6.0; /* Thinner scrollbars for modern look */
}

- (BOOL) scrollViewUseBottomCorner
{
  return YES;
}

- (BOOL) scrollViewScrollersOverlapBorders
{
  return NO;
}

@end
