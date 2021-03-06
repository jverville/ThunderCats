//
//  UIDevice+TCAdditions.m
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


#import "UIDevice+TCAdditions.h"


static const CGFloat kNavigationBarHeightPortrait = 44.0;
static const CGFloat kNavigationBarHeightLandscape = 32.0;

NSString *const kVersionStringIOS6 = @"6.0";
NSString *const kVersionStringIOS7 = @"7.0";
NSString *const kVersionStringIOS8 = @"8.0";

NSString *const TCIOSVersionStringIOS6 = @"6.0";
NSString *const TCIOSVersionStringIOS7 = @"7.0";
NSString *const TCIOSVersionStringIOS8 = @"8.0";


@implementation UIDevice (TCAdditions)

#pragma mark - Screen Dimension Checking Methods

+ (BOOL)tc_isScreenHeight480
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    return screenSize.size.height == 480;
}


+ (BOOL)tc_isScreenHeight568
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    return screenSize.size.height == 568;
}



#pragma mark - Screen Dimensions

+ (CGSize)tc_screenSize
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    
    if ([UIDevice tc_isVersionLessThan:TCIOSVersionStringIOS8] &&
        UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        return CGSizeMake(CGRectGetHeight(screenBounds), CGRectGetWidth(screenBounds));
    }
    else
    {
        return screenBounds.size;
    }
}


+ (CGFloat)tc_screenHeight
{
    return [UIDevice tc_screenSize].height;
}


+ (CGFloat)tc_screenWidth
{
    return [UIDevice tc_screenSize].width;
}


+ (CGSize)tc_statusBarSize
{
    CGSize size = [UIApplication sharedApplication].statusBarFrame.size;
    
    if ([UIDevice tc_isVersionLessThan:TCIOSVersionStringIOS8] &&
        UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        return CGSizeMake(size.height, size.width);
    }
    else
    {
        return size;
    }
}


+ (CGFloat)tc_statusBarHeight
{
    return CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}


+ (CGFloat)tc_navigationBarHeight
{
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation))
    {
        return kNavigationBarHeightPortrait;
    }
    else
    {
        return kNavigationBarHeightLandscape;
    }
}



#pragma mark - iPad/iPhone Checking Methods

+ (BOOL)tc_isPad
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}


+ (BOOL)tc_isPhone
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}



#pragma mark - iOS Version Checking Methods

+ (BOOL)tc_isVersionEqualTo:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] == NSOrderedSame);
}


+ (BOOL)tc_isVersionGreaterThan:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] == NSOrderedDescending);
}


+ (BOOL)tc_isVersionGreaterThanOrEqualTo:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] != NSOrderedAscending);
}


+ (BOOL)tc_isVersionLessThan:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] == NSOrderedAscending);
}


+ (BOOL)tc_isVersionLessThanOrEqualTo:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] != NSOrderedDescending);
}

@end
