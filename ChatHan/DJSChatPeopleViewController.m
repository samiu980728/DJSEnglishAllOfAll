//
//  DJSChatPeopleViewController.m
//  ChatHan
//
//  Created by 萨缪 on 2019/4/18.
//  Copyright © 2019年 lee. All rights reserved.
//

#import "DJSChatPeopleViewController.h"
#import "DJSChatViewController.h"
#import "DJSmatchingView.h"

@interface DJSChatPeopleViewController ()<DJSmatchingViewDelegate>

@end

@implementation DJSChatPeopleViewController
{
    UIImageView *backImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * peopleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    peopleButton.frame = CGRectMake(50, 100, 200, 30);
    peopleButton.tintColor = [UIColor blackColor];
    [peopleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [peopleButton setTitle:@"best lover" forState:UIControlStateNormal];
    [peopleButton addTarget:self action:@selector(pushChatViewButton:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:peopleButton];
    self.navigationItem.title = @"聊天室";
    
    [self creatSky];
}

- (void)pushChatViewButton:(UIButton *)Button
{
    DJSChatViewController * viewController = [[DJSChatViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pushChatViewButton:)];
    nav.navigationController.navigationItem.leftBarButtonItem = barButtonItem;
    nav.title = @"聊天";
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //背景旋转
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    animation.duration  = 200;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    
    
    [backImageView.layer addAnimation:animation forKey:nil];
}
-(void)creatSky{
    //椭圆倾斜
    float height = [UIScreen mainScreen].bounds.size.height;
    float width = [UIScreen mainScreen].bounds.size.width;
    
    DJSmatchingView *matchingView = [[DJSmatchingView alloc]initWithFrame:CGRectMake(-40, height/2 - width/4, width + 100, width/2)];
    matchingView.delegate = self;
    matchingView.transform = CGAffineTransformRotate(matchingView.transform, M_PI - M_PI_2/6);
    
    backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backPicture.jpeg"]];
    backImageView.frame = CGRectMake(0, 0, hypotf(width, height), hypotf(width, height));
    backImageView.center = self.view.center;
    
    [self.view addSubview:backImageView];
    [self.view addSubview:matchingView];
}
-(void)matchingViewButtonClick:(NSInteger)index{
    NSLog(@"%ld",(long)index);
    
    //push过去
    switch (index) {
        case 0:{//已关
            
        }
            break;
        case 1:{//已聊
            DJSChatViewController *chatViewController = [[DJSChatViewController alloc]init];
            [self.navigationController pushViewController:chatViewController animated:YES];
        }
            break;
        case 2:{//匹配
            
        }
            break;
            //        default:
            //            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
