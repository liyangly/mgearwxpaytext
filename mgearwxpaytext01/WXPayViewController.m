//
//  WXPayViewController.m
//  mgearwxpaytext01
//
//  Created by 李阳 on 16/7/21.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "WXPayViewController.h"

@interface WXPayViewController ()
@property(nonatomic, strong) UIButton *payButton;
@end

@implementation WXPayViewController

#pragma mark - life cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"微信支付";
  self.view.backgroundColor = [UIColor whiteColor];
  // Do any additional setup after loading the view.
  [self initsubviews];
}

- (void)initsubviews {
  [self.view addSubview:self.payButton];
  self.payButton.frame =
      CGRectMake(10, 200, self.view.frame.size.width - 20, 44);
}

#pragma mark - private method
- (void)wxpay:(UIButton *)sender {
  [WXApiRequestHandler jumpToWxPay];
}

#pragma mark - setter and getter
- (UIButton *)payButton {
  if (!_payButton) {
    _payButton = [[UIButton alloc] init];
    [_payButton setTitle:@"支付" forState:UIControlStateNormal];
    [_payButton setBackgroundColor:[UIColor cyanColor]];
    [_payButton addTarget:self
                   action:@selector(wxpay:)
         forControlEvents:UIControlEventTouchUpInside];
  }
  return _payButton;
}

@end
