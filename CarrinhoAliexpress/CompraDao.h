//
//  CompraDao.h
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Compra.h"
#import "ItemCompra.h"

@interface CompraDao : NSObject

+(CompraDao*)compraDaoInstance;

-(void)addItem:(ItemCompra*) item;

-(int) size;

-(ItemCompra*) itemNaLinha:(NSInteger)index;

-(void)salvar;

@end
