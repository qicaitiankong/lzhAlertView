//
//  lzhShowSureAndCancelView.m
//  TD
//
//  Created by 李自豪 on 2017/5/2.
//  Copyright © 2017年 霸枪001. All rights reserved.
//

#import "lzhShowSureAndCancelView.h"

@implementation lzhShowSureAndCancelView

+ (lzhShowSureAndCancelView*)getSelfClass{
    lzhShowSureAndCancelView *selfClass = nil;
    if(selfClass == nil){
        selfClass = [[lzhShowSureAndCancelView alloc]init];
    }
    return selfClass;
}

- (void)showAlertView:(NSString*)title sureHandler:(SEL)sureHandler target:(id)target{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    alertController.title = title;
    
    UIAlertAction*alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"取消");

    }];
    
    [alertController addAction:alertAction];
    
    UIAlertAction*alertAction2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"确定");
        if([target respondsToSelector:sureHandler]){
            [target performSelector:sureHandler];
        }
    }];
    
    [alertController addAction:alertAction2];

    
       UIViewController *vc = [self getCurrentVC];
    if(vc){
        [vc presentViewController:alertController animated:NO completion:^{
            
        }];
    }
   
}
//返回当前显示的控制器
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
@end
