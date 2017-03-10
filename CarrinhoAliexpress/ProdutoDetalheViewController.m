//
//  ProdutoDetalheViewController.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "ProdutoDetalheViewController.h"
#import "ItemCompra.h"
#import "CompraDao.h"
#import "CarrinhoViewController.h"

@interface ProdutoDetalheViewController ()

@end

@implementation ProdutoDetalheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nome.text = self.produto.nome;
    self.descricao.text = self.produto.descricao;
    self.valor.text = [NSString stringWithFormat:@"R$ '%f'", self.produto.valor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Metodo onClick para ir para o carrinho de compras
- (IBAction) onClickAddProduto {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Quantidade" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * textField){
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action){
                                                         UITextField *qtd = [alert.textFields firstObject];
                                                         NSLog(@"Passou por aqui");
                                                         
                                                         [self adicionarProduto:[qtd.text intValue]];
                                                     }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    

}

-(void) adicionarProduto:(NSInteger) qtd{
    
    ItemCompra* item = [ItemCompra new];
    item.produto = _produto;
    item.quantidade = qtd;
    item.valor = qtd * _produto.valor;
    
    CompraDao *dao = [CompraDao compraDaoInstance];
    [dao addItem:item];
    
    CarrinhoViewController *vc = [CarrinhoViewController new];
    
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: vc];
    [self.navigationController pushViewController: vc
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
