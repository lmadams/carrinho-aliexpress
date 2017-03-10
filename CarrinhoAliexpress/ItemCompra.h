//
//  ItemCompra.h
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Produto.h"

@interface ItemCompra : NSObject

@property Produto *produto;
@property NSInteger codCompra;
@property double valor;
@property double quantidade;

@end
