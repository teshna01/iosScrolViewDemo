//
//  ViewController.h
//  ScrolViewDemo
//
//  Created by JF（朝阳区图书馆） on 14-9-27.
//  Copyright (c) 2014年 witmob. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController{
UIView *dwView;
UIButton *dwBtn;
    __weak IBOutlet UIButton *Button;
NSMutableArray *viewArray,*titleArray;
}
@property(nonatomic,assign)NSInteger dwNum;

@end

