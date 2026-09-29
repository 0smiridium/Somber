#import "Sombre.h"

@interface Sombre(Radio)
- (void) drawRadioButton: (NSRect) frame
                     in: (NSCell*) cell
                  state: (GSThemeControlState) state
                  value: (BOOL) value;

- (void) drawCheckBox: (NSRect) frame
                   in: (NSCell*) cell
                state: (GSThemeControlState) state
                value: (BOOL) value;
@end
