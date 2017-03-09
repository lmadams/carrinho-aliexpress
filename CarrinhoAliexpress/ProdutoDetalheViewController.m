//
//  ProdutoDetalheViewController.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "ProdutoDetalheViewController.h"

@interface ProdutoDetalheViewController ()

@end

@implementation ProdutoDetalheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Metodo onClick para ir para o carrinho de compras
- (IBAction) onClickAddProduto {
    UIStoryboard *storeBoard = [UIStoryboard storyboardWithName: @"Main"
                                                         bundle: nil];
    UIViewController *carrinhoView = [storeBoard instantiateViewControllerWithIdentifier: @"CarrinhoView"];
    
    [self.navigationController pushViewController: carrinhoView
                                         animated: YES];

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
