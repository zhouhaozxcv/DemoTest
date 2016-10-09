//
//  TransformViewController.m
//  Demo
//
//  Created by 梁晨 on 16/10/9.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "TransformViewController.h"
#import "TransformManager.h"
//#import "NSArray+Checking.h"

@interface TransformViewController (){
    UITextField *lbl;
}

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    lbl = [[UITextField alloc] initWithFrame:CGRectMake(100, 64, 100, 20)];
    lbl.backgroundColor = [UIColor orangeColor];
    lbl.placeholder = @"请输入";
    [self.view addSubview:lbl];
    
    
    self.titles = @[@"十进制转换为二进制",
                    @"二进制转换为十进制",
                    @"十进制转换为十六进制",
                    @"十六进制转换为十进制"];
    self.selNames = @[@"decimalToBinary:",
                      @"binaryToDecimal:",
                      @"decimalToHex:",
                      @"hexToDecimal:"];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *selName = [self.selNames objectAtIndex:indexPath.row];
//    if (selName && selName.length > 0) {
//        SEL sel = NSSelectorFromString(selName);
////        IMP imp = [self methodForSelector:sel];
////        imp();
//        [self performSelector:sel withObject:lbl.text afterDelay:0];
//        
//    }
    switch (indexPath.row) {
        case 0:
            [self decimalToBinary:lbl.text.integerValue];
            break;
        case 1:
            [self binaryToDecimal:lbl.text];
            break;
        case 2:
            [self decimalToHex:lbl.text.integerValue];
            break;
        case 3:
            [self hexToDecimal:lbl.text];
            break;
            
        default:
            break;
    }
}

///十进制转换为二进制
- (void)decimalToBinary:(NSInteger)decimalNum{
    NSLog(@"%@",[TransformManager decimalToBinary:decimalNum]);
}


///二进制转换为十进制，return -1，输入有误
- (void)binaryToDecimal:(NSString *)binary{
    NSLog(@"%ld",(long)[TransformManager binaryToDecimal:binary]);
}


///十进制转换为十六进制
- (void)decimalToHex:(NSInteger)decimalNum{
   NSLog(@"%@", [TransformManager decimalToHex:decimalNum]);
}


///十六进制转换为十进制
- (void)hexToDecimal:(NSString *)hex{
    NSLog(@"%@",[TransformManager hexToDecimal:hex]);
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
