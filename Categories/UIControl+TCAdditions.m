//
//  UIControl+TCAdditions.m
//  ThunderCats
//
//  Copyright (c) 2015 Metova Inc.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "UIControl+TCAdditions.h"

@implementation UIControl (TCAdditions)

- (BOOL)tc_isControlWiredToTarget:(id)target
              forIBActionSelector:(SEL)ibactionSelector
                  forControlEvent:(UIControlEvents)controlEvent
{
    NSString *actionSelectorString = NSStringFromSelector(ibactionSelector);
    NSArray *actionsForTarget = [self actionsForTarget:target forControlEvent:controlEvent];
    
    for (NSString *action in actionsForTarget)
    {
        if ([actionSelectorString isEqualToString:action] == YES)
        {
            return YES;
        }
    }
    
    return NO;
}

@end
