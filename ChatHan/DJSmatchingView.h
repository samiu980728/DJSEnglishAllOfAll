//
//  DJSmatchingView.h
//  ChatHan
//
//  Created by 萨缪 on 2019/4/21.
//  Copyright © 2019年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DJSmatchingViewDelegate <NSObject>
-(void)matchingViewButtonClick:(NSInteger)index;
@end

@interface DJSmatchingView : UIView

@property(nonatomic , strong)UIButton *chatedButton;
@property(nonatomic , strong)UIButton *followedButton;
@property(nonatomic , strong)UIButton *matchingButton;

@property(nonatomic , strong)UIButton *centerButton;
@property(nonatomic , strong)UIButton *middleButton;
@property(nonatomic , strong)UIButton *outButton;

@property(nonatomic , assign)id<DJSmatchingViewDelegate> delegate;

@end
