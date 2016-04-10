//
//  ViewController.h
//  ZBFTP_GoldRaccoon
//
//  Created by 肖志斌 on 16/4/9.
//  Copyright © 2016年 xzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *hostTextField;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *pswtTextField;
@property (weak, nonatomic) IBOutlet UILabel *showLab;

- (IBAction)askListBtnClick:(id)sender;
- (IBAction)uploadFileBtnClick:(id)sender;
- (IBAction)downloadBtnClick:(id)sender;
- (IBAction)deleteFileBtnClick:(id)sender;
- (IBAction)createDirBtnClick:(id)sender;
- (IBAction)deleteDirBtnClick:(id)sender;


@end

