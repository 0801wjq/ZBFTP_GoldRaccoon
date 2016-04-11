//
//  ViewController.m
//  ZBFTP_GoldRaccoon
//
//  Created by 肖志斌 on 16/4/9.
//  Copyright © 2016年 xzb. All rights reserved.
//

#import "ViewController.h"
#import "ZBFtpTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (void)sFtpInit
{
    [ZBFtpTools ZBFtp_setupInitWithHost:self.hostTextField.text
                                   user:self.userTextField.text
                                    psw:self.pswtTextField.text];
}
- (IBAction)askListBtnClick:(id)sender
{
    [self sFtpInit];
    [ZBFtpTools ZBFtp_AskListWithDirectorAtPath:@"/"
                                       backList:^(NSArray *listArray)
     {
         for (NSString *fileName in listArray)
         {
             NSLog(@"%@",fileName);
         }
         _showLab.text = @"list请求完成";
     }
                                   requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}
- (IBAction)uploadFileBtnClick:(id)sender
{
    [self sFtpInit];
    NSString *localPathStr = [[NSBundle mainBundle] pathForResource:@"img1" ofType:@"png"];
    NSString *remotaPathStr = @"/中文文件名china.png";
    
    [ZBFtpTools ZBFtp_UploadFileWithLocalPath:localPathStr
                                   remotaPath:remotaPathStr
                                 percentBlock:^(CGFloat percent)
     {
         _showLab.text = [NSString stringWithFormat:@"%.2f%%",percent *100];
     }
                               completeUpload:^
     {
         _showLab.text = @"上传完成";
     }
                                 requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}
- (IBAction)downloadBtnClick:(id)sender
{
    [self sFtpInit];
    NSString *localPathStr = [NSTemporaryDirectory() stringByAppendingString:@"中文文件名china.png"];
    NSLog(@"--localPathStr-->%@<-----",localPathStr);
    NSString *remotaPathStr = @"/中文文件名china.png";
    
    [ZBFtpTools ZBFtp_DownloadFileAtRemotePath:remotaPathStr
                                   toLocalPath:localPathStr
                                  percentBlock:^(CGFloat percent)
     {
         _showLab.text = [NSString stringWithFormat:@"%.2f%%",percent *100];
     }
                              completeDownload:^
     {
         _showLab.text = @"下载完成";
     }
                                  requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}
- (IBAction)deleteFileBtnClick:(id)sender
{
    [self sFtpInit];
    NSString *deleteFilePathStr = @"/中文文件名china.png";
    [ZBFtpTools ZBFtp_DeleteFileAtPath:deleteFilePathStr
                        completeDelete:^
     {
         _showLab.text = @"删除完成";
     }
                          requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}
- (IBAction)createDirBtnClick:(id)sender
{
    [self sFtpInit];
    NSString *directoryPathStr = @"中文目录china/";
    [ZBFtpTools ZBFtp_CreateDirectoryAtPath:directoryPathStr
                    completeCreateDirectory:^
     {
         _showLab.text = @"创建完成";
     }
                               requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}
- (IBAction)deleteDirBtnClick:(id)sender
{
    [self sFtpInit];
    NSString *deleteDirPathStr = @"中文目录china/";
    [ZBFtpTools ZBFtp_DeleteFileAtPath:deleteDirPathStr
                        completeDelete:^
     {
         _showLab.text = @"删除完成";
     }
                          requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}

@end
