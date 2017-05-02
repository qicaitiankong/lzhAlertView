//
//  lzhShowSureAndCancelView.h
//  TD
//
//  Created by 李自豪 on 2017/5/2.
//  Copyright © 2017年 霸枪001. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface lzhShowSureAndCancelView : NSObject
- (void)showAlertView:(NSString*)title sureHandler:(SEL)sureHandler target:(id)target;
+ (lzhShowSureAndCancelView*)getSelfClass;

@end
