//
//  ProdutoDetalheViewController.h
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Produto.h"

@interface ProdutoDetalheViewController : UIViewController

@property Produto *produto;
@property IBOutlet UILabel *nome;
@property IBOutlet UILabel *descricao;
@property IBOutlet UILabel *valor;

@end
