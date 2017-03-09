//
//  ViewController.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Metodo onClick para ir ate o carrinho de compras
- (void) onClickCarrinho {
    UIStoryboard *storeBoard = [UIStoryboard storyboardWithName: @"Main"
                                                         bundle: nil];
    UIViewController *carrinhoView = [storeBoard instantiateViewControllerWithIdentifier: @"CarrinhoView"];
    
    [self.navigationController pushViewController: carrinhoView
                                         animated: YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];

//    Add btn para o carrinho de compras
    UIBarButtonItem *btnCarrinho = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(onClickCarrinho)];
    self.navigationItem.rightBarButtonItem = btnCarrinho;
    
    self.produtoDao = [ProdutoDao produtoDaoInstance];
}

// Vai para os detalhes do produto
-(IBAction) onClickProduto {
    
    UIStoryboard *storeBoard = [UIStoryboard storyboardWithName: @"Main"
                                                         bundle: nil];
    ViewController *detalheProduto = [storeBoard instantiateViewControllerWithIdentifier: @"DetalheProdutosView"];

    [self.navigationController pushViewController: detalheProduto
                                         animated: YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
