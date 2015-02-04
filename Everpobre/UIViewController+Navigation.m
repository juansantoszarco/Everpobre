//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 04/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)



-(UINavigationController*) jszWrappedInNavigation{
    // es lo mismo new que alloc initwithrootviewcontroller
    
    UINavigationController* nav = [UINavigationController new];
    
    [nav pushViewController:self
                   animated:NO];
    
    return nav;
    
}

@end
