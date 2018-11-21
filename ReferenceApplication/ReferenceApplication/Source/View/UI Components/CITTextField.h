//
//  CITTextField.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CITTextField : UITextField

- (void)invalidate;
- (void)shake;
- (NSString *)textWithoutSpace;

@end
